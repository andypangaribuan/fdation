/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of mix_json;

Map<String, dynamic> _omitempty(List<String> keys, Map<String, dynamic> serial) {
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
