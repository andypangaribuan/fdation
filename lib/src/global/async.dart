/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';

Future<T?> asyncTry<T>({required Future<T> Function() action, FOnError? onError, FSetError? setError, T? defaultValue}) async {
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
