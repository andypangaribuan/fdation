/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library global_async;

import 'package:fdation/fdation.dart';

part 'async_model.dart';

Future<T?> asyncTry<T>({required Future<T?> Function() action, FOnError? onError, FSetError? setError, T? defaultValue}) async {
  try {
    return await action();
  } catch (ex, stackTrace) {
    await onError?.call(ex, stackTrace);
    if (setError != null) {
      final err = setError.call();
      err.isError = true;
      err.err = ex;
      err.stackTrace = stackTrace;
    }
  }

  return defaultValue;
}

Future<GroupWait2<T1, T2>> groupWait2<T1, T2>(Future<T1> f1, Future<T2> f2) async {
  final res = await Future.wait([f1, f2]);
  return GroupWait2._(res[0] as T1, res[1] as T2);
}
