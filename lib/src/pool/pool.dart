/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library pool;

import 'dart:async';

import 'package:fdation/fdation.dart';
import 'package:synchronized/synchronized.dart';

part 'pool_instance.dart';
part 'src/pool_impl.dart';

abstract class FPool<T extends FPoolInstance> {
  int get totalInstances;
  Future<T> get instance;

  // if maxConcurrent > 0 then maxIdle cannot perform.
  // maxConcurrent means maximum concurrency for the pool-instance.
  // maxConcurrent have dependency with pool-instance.lifetime,
  // to perform auto dispose (also remove from instances).
  //
  // maxIdle means maximum pool-instance that can be idle, and
  // will auto dispose (also remove from instance) if have pool-instance.lifetime.
  // maxOpen means maximum concurrency for the pool-instance, this can be 0.
  // if maxOpen = 0, then unlimited concurrency for the pool-instance.
  factory FPool({
    required T Function() newInstance,
    int maxConcurrent = 2,
    int maxIdle = 0,
    int maxOpen = 0,
    Duration openLifetime = const Duration(minutes: 5),
  }) =>
      _FPool(
        newInstance: newInstance,
        maxConcurrent: maxConcurrent,
        maxIdle: maxIdle,
        maxOpen: maxOpen,
        openLifetime: openLifetime,
      );
}
