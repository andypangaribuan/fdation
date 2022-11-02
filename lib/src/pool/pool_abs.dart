/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of pool;

abstract class FPoolInstance {
  late int _id;
  bool _isIdle = false;
  late final bool _canIdle;
  FPool Function()? _pool;
  FTimer? _disposeTimer;

  Duration? lifetime;

  void release() {
    print('${DateTime.now()} release() | id: $_id');
    _isIdle = true;
    _disposeTimer?.resetAndStart();
    _pool?.call()._release();
  }

  void dispose() {
    print('${DateTime.now()} _dispose() | id: $_id | $_canIdle');
    _pool = null;
    _disposeTimer?.cancel();
    _disposeTimer = null;
  }
}
