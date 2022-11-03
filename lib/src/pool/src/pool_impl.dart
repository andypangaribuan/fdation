/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of pool;

class _FPool<T extends FPoolInstance> implements FPool<T> {
  final _queueLock = Lock();
  final _getLock = Lock();

  late final T Function() _newInstance;
  late final int _maxConcurrent;
  late final int _maxIdle;
  late final int _maxOpen;
  late final Duration _openLifetime;
  final _instances = <T>[];
  final _queue = <Completer<T>>[];
  var _instanceIdIncrement = 0;

  @override
  int get totalInstances => _instances.length;

  @override
  Future<T> get instance async {
    final instance = await _get();
    if (instance != null) {
      instance._disposeTimer?.cancel();
      return instance;
    }

    return await _queueLock.synchronized<Future<T>>(() async {
      final c = Completer<T>();
      _queue.add(c);
      return c.future;
    });
  }

  _FPool({
    required T Function() newInstance,
    required int maxConcurrent,
    required int maxIdle,
    required int maxOpen,
    required Duration openLifetime,
  }) {
    _newInstance = newInstance;
    _maxConcurrent = maxConcurrent > 0
        ? maxConcurrent
        : maxIdle <= 0
            ? 2
            : 0;
    _maxIdle = maxConcurrent > 0
        ? 0
        : maxIdle > 0
            ? maxIdle
            : 0;
    _maxOpen = maxConcurrent > 0
        ? 0
        : maxOpen <= 0
            ? 0
            : maxOpen < _maxIdle
                ? _maxIdle
                : maxOpen;
    _openLifetime = openLifetime;
  }

  Future<T?> _get({bool isIdle = false}) async {
    return _getLock.synchronized(() async {
      if (_maxConcurrent == 0 && _maxIdle == 0) {
        return null;
      }

      final ins = _instances.safeFirstWhere((e) => e._isIdle);
      if (ins != null) {
        ins._isIdle = isIdle;
        return ins;
      }

      if (_maxConcurrent > 0 && _instances.length >= _maxConcurrent) {
        return null;
      }

      var isKeep = true;
      if (_maxIdle > 0 && _instances.length >= _maxIdle) {
        if (_maxOpen > 0 && _instances.length >= _maxOpen) {
          return null;
        }
        isKeep = _instances.where((e) => e._canIdle).length < _maxIdle;
      }

      final instance = _newInstance();
      instance._id = _instanceIdIncrement++;
      instance._isIdle = isIdle;
      instance._canIdle = isKeep;
      instance._pool = () => this;

      if (isKeep && instance.lifetime != null) {
        instance._disposeTimer = FTimer(
          instance.lifetime!,
          () => _disposeInstance(instance._id),
        );
      }

      if (!isKeep) {
        instance._disposeTimer = FTimer(
          _openLifetime,
          () => _disposeInstance(instance._id),
        );
      }

      _instances.add(instance);
      return instance;
    });
  }

  void _release() {
    _queueLock.synchronized(() async {
      if (_queue.isNotEmpty) {
        while (true) {
          final instance = await _get();
          instance?._disposeTimer?.cancel();
          if (instance != null) {
            final q = _queue[0];
            _queue.removeAt(0);
            q.complete(instance);
            break;
          }

          await Future.delayed(Duration(milliseconds: 10));
        }
      }
    });
  }

  void _disposeInstance(int id) {
    _getLock.synchronized(() async {
      final idx = _instances.indexWhere((e) => e._id == id);
      if (idx > -1) {
        final instance = _instances[idx];
        _instances.removeAt(idx);
        instance.dispose();
      }
    });
  }
}
