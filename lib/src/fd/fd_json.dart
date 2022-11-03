/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/src/mix/json_serializable.dart';

abstract class FDJson {
  dynamic convert(Object? obj, {bool trimDoubleQuotes = false, String? fieldName, FJsonSerializable? jsonSerializable});
  String serialize(Object? obj, {bool trimDoubleQuotes = false});
}
