/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

abstract class NetResponse {
  int get statusCode;
  dynamic get data;

  Object? get error;
  StackTrace? get stackTrace;

  bool get isError;
  bool get isNotError;

  bool get isOK;
  bool get isForbidden;

  Future<void> Function(dynamic data)? whenOK;
  Future<void> Function(Object? err, StackTrace? trace)? whenForbidden;

  Future<void> wait();
}
