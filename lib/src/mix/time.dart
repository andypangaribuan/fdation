/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library mix_timer;

import 'dart:async' show Timer, Zone;

import 'package:clock/clock.dart' show clock;

part 'src/timer_impl.dart';

abstract class FTimer implements Timer {
  void Function() get callback;
  set callback(void Function() callback);

  Duration get duration;
  set duration(Duration duration);

  Duration get elapsed;
  bool get isPaused;
  bool get isExpired;

  factory FTimer(Duration duration, void Function() callback) => _FTimerImpl(duration, callback);

  void start();

  void pause();

  void reset();

  void resetAndStart();
}
