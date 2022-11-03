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
  bool get isOK => _response?.statusCode == 200;

  @override
  bool get isForbidden => (_response?.statusCode ?? _dioError?.response?.statusCode) == 403;


  
  @override
  Future<void> Function(dynamic data)? whenOK;

  @override
  Future<void> Function(Object? err, StackTrace? trace)? whenForbidden;
  
  @override
  Future<void> wait() async {
    if (whenOK != null) {
      await whenOK?.call(data);
    }
  }

}
