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
  _FPool Function()? _pool;
  FTimer? _disposeTimer;

  Duration? lifetime;

  void release() {
    _isIdle = true;
    _disposeTimer?.resetAndStart();
    _pool?.call()._release();
  }

  void dispose() {
    _pool = null;
    _disposeTimer?.cancel();
    _disposeTimer = null;
  }
}
