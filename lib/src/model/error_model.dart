/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

class FError {
  bool isError = false;
  bool get isNotError => !isError;
  
  Object? err;
  StackTrace? stackTrace;

  FError._();

  factory FError.notError() {
    return FError._();
  }
}