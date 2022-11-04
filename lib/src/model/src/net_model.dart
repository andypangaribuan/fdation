/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/src/global/alias.dart';

abstract class NetResponse {
  int get statusCode;
  dynamic get data;

  Object? get error;
  StackTrace? get stackTrace;

  bool get isError;
  bool get isNotError;

  // http-code 200 OK
  bool get isOK;
  // http-code 201 Created
  bool get isCreated;
  // http-code 202 Accepted
  bool get isAccepted;

  // http-code 400 Bad Request
  bool get isBadRequest;
  // http-code 401 Unauthorized
  bool get isUnauthorized;
  // http-code 403 Forbidden
  bool get isForbidden;
  // http-code 404 Not Found
  bool get isNotFound;
  // http-code 406 Not Acceptable
  bool get isNotAcceptable;
  // http-code 428 Precondition Required
  bool get isPreconditionRequired;
  // http-code 451 Unavailable For Legal Reasons
  bool get isUnavailableForLegalReasons;

  // http-code 0
  bool get isUnknown;

  Future<R?> whenOK<T, R>(Future<R> Function(T response) callback);
  Future<R?> whenCreated<T, R>(Future<R> Function(T response) callback);
  Future<R?> whenAccepted<T, R>(Future<R> Function(T response) callback);

  Future<R?> whenBadRequest<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenUnauthorized<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenForbidden<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenNotFound<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenNotAcceptable<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenPreconditionRequired<T, R>(NetResponseWhenCallback<T, R> callback);
  Future<R?> whenUnavailableForLegalReasons<T, R>(NetResponseWhenCallback<T, R> callback);

  Future<R?> whenUnknown<R>(Future<R> Function(Object err, StackTrace stackTrace) callback);
}
