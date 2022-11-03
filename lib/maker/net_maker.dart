/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library net_maker;

import 'package:dio/dio.dart';
import 'package:fdation/src/model/model.dart';
import 'package:fdation/src/net/net.dart';

part '../src/net/src/impl.dart';
part '../src/net/src/model.dart';

Net makeNet({
  int? connectionTimeout,
  int? receiveTimeout,
  int? sendTimeout,
  String? contentType,
}) =>
    _Net(
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
    );
