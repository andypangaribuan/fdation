/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/maker/net_maker.dart';
import 'package:fdation/src/model/src/net_model.dart';

abstract class Net {
  // connectionTimeout default value 15s
  // receiveTimeout default value 30s
  // sendTimeout default value 30s
  // contentType default value 30s
  factory Net({
    int? connectionTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    String? contentType,
  }) =>
      makeNet(
        connectionTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        contentType: contentType,
      );

  Future<NetResponse> get(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameter,
  });

  Future<NetResponse> post(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? body,
  });
}
