/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of mix_timer;

class _FTimerImpl implements FTimer {
  final Zone _zone;
  Stopwatch? _stopwatch = clock.stopwatch();
  Timer? _timer;
  int _tick = 0;

  @override
  void Function() callback;

  @override
  Duration duration;

  @override
  Duration get elapsed => _stopwatch?.elapsed ?? duration;

  @override
  bool get isPaused => _timer == null && !isExpired;

  @override
  bool get isExpired => _stopwatch == null;

  @override
  bool get isActive => _timer != null;

  @override
  int get tick => _tick;

  _FTimerImpl(this.duration, this.callback)
      : assert(duration >= Duration.zero),
        _zone = Zone.current;

  @override
  void start() {
    if (isActive || isExpired) {
      return;
    }

    _startTimer();
  }

  @override
  void pause() {
    _stopwatch?.stop();
    _timer?.cancel();
    _timer = null;
  }

  @override
  void reset() {
    _stopwatch = clock.stopwatch();

    if (isActive) {
      _timer!.cancel();
      _startTimer();
    }
  }

  @override
  void resetAndStart() {
    _stopwatch = clock.stopwatch();

    if (!isActive) {
      cancel();
      _startTimer();
    } else {
      _timer!.cancel();
      _startTimer();
    }
  }

  @override
  void cancel() {
    _stopwatch?.stop();
    _timer?.cancel();
    _timer = null;
  }

  void _startTimer() {
    assert(_stopwatch != null);

    _timer = _zone.createTimer(duration - _stopwatch!.elapsed, () {
      _tick++;
      _timer = null;
      _stopwatch = null;
      _zone.run(callback);
    });

    _stopwatch!.start();
  }
}
