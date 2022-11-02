/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:meta/meta.dart';

abstract class FJsonSerializable {
  // supported value: string, int, double, bool, datetime
  Map<String, dynamic> serialize();

  @protected
  Map<String, dynamic> omitempty(List<String> keys, Map<String, dynamic> serial) {
    for (var key in keys) {
      final val = serial[key];

      var canRemove = val == null;
      if (!canRemove && val is String) {
        canRemove = val.trim().isEmpty;
      }

      if (canRemove) {
        serial.remove(key);
      }
    }

    return serial;
  }
}
