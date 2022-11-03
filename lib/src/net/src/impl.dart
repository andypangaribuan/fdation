/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of net_maker;

class _Net implements Net {
  late final Dio _dio;

  _Net({int? connectionTimeout, int? receiveTimeout, int? sendTimeout, String? contentType}) {
    connectionTimeout = connectionTimeout == null ? 15000 : connectionTimeout * 1000; //default: 15s
    receiveTimeout = receiveTimeout == null ? 30000 : receiveTimeout * 1000; //default: 30s
    sendTimeout = sendTimeout == null ? 30000 : sendTimeout * 1000; //default: 30s
    contentType ??= 'application/json';

    _dio = Dio(BaseOptions(
      receiveTimeout: receiveTimeout,
      connectTimeout: connectionTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
    ));
  }

  @override
  Future<NetResponse> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;
    DioError? dioErr;
    Object? errObj;
    StackTrace? errStack;

    try {
      response = await _dio.get(
        path,
        options: headers == null ? null : Options(headers: headers),
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      dioErr = e;
    } catch (e, stackTrace) {
      errObj = e;
      errStack = stackTrace;
    }
    
    return _NetResponse(
      response: response,
      dioError: dioErr,
      errObj: errObj,
      errStack: errStack,
    );
  }
}
