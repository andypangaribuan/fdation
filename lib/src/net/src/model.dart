/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of net_maker;

class _NetResponse implements NetResponse {
  late final Response? _response;
  late final DioError? _dioError;
  late final Object? _errObj;
  late final StackTrace? _errStack;

  _NetResponse({
    Response? response,
    DioError? dioError,
    Object? errObj,
    StackTrace? errStack,
  }) {
    _response = response;
    _dioError = dioError;
    _errObj = errObj;
    _errStack = errStack;
  }

  @override
  int get statusCode => _response?.statusCode ?? _dioError?.response?.statusCode ?? 0;

  @override
  dynamic get data => _response?.data ?? _dioError?.response?.data;

  @override
  Object? get error => _dioError?.error ?? _errObj;

  @override
  StackTrace? get stackTrace => _dioError?.stackTrace ?? _errStack;

  @override
  bool get isError => !isNotError;

  @override
  bool get isNotError => _dioError == null && _errObj == null;

  @override
  bool get isOK => statusCode == 200;

  @override
  bool get isCreated => statusCode == 201;

  @override
  bool get isAccepted => statusCode == 202;

  @override
  bool get isBadRequest => statusCode == 400;

  @override
  bool get isUnauthorized => statusCode == 401;

  @override
  bool get isForbidden => statusCode == 403;

  @override
  bool get isNotFound => statusCode == 404;

  @override
  bool get isNotAcceptable => statusCode == 406;

  @override
  bool get isPreconditionRequired => statusCode == 428;

  @override
  bool get isUnavailableForLegalReasons => statusCode == 451;

  @override
  bool get isUnknown => statusCode == 0;

  @override
  Future<R?> whenOK<T, R>(Future<R> Function(T response) callback) async {
    return isOK ? callback(data) : null;
  }

  @override
  Future<R?> whenCreated<T, R>(Future<R> Function(T response) callback) async {
    return isCreated ? callback(data) : null;
  }

  @override
  Future<R?> whenAccepted<T, R>(Future<R> Function(T response) callback) async {
    return isAccepted ? callback(data) : null;
  }

  @override
  Future<R?> whenBadRequest<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isBadRequest ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenUnauthorized<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isUnauthorized ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenForbidden<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isForbidden ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenNotFound<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isNotFound ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenNotAcceptable<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isNotAcceptable ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenPreconditionRequired<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isPreconditionRequired ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenUnavailableForLegalReasons<T, R>(NetResponseWhenCallback<T, R> callback) async {
    return isUnavailableForLegalReasons ? callback(data, error!, stackTrace!) : null;
  }

  @override
  Future<R?> whenUnknown<R>(Future<R> Function(Object err, StackTrace stackTrace) callback) async {
    return isUnknown ? callback(error!, stackTrace!) : null;
  }
}
