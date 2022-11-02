/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd;

class _Json {
  dynamic convert(Object? obj, {bool trimDoubleQuotes = false, String? fieldName, FJsonSerializable? jsonSerializable}) {
    if (obj == null) {
      return obj;
    }

    if (obj is String || obj is int || obj is double || obj is bool) {
      return obj;
    }
    
    if (obj is DateTime) {
      return obj.toIso8601String();
    }

    if (obj is List) {
      return obj.loopToList((e) => convert(e, trimDoubleQuotes: trimDoubleQuotes));
    }

    if (obj is FJsonSerializable) {
      final dict = obj.serialize();
      for (final e in dict.entries) {
        dict[e.key] = convert(e.value, fieldName: e.key, jsonSerializable: obj);
      }
      return dict;
    }

    if (obj is Map) {
      final dictio = <dynamic, dynamic>{};
      for (final kv in obj.entries) {
        dictio[kv.key] = convert(kv.value);
      }

      return dictio;
    }

    return serialize(obj, trimDoubleQuotes: trimDoubleQuotes);
  }

  String serialize(Object? obj, {bool trimDoubleQuotes = false}) {
    var encoded = json.encode(obj, toEncodable: (o) {
      if (o is FJsonSerializable) {
        return o.serialize();
      }
      return null;
    });

    if (trimDoubleQuotes) {
      if (encoded.length >= 2 && encoded.substring(0, 1) == '"' && encoded.substring(encoded.length - 1) == '"') {
        encoded = encoded.substring(0, encoded.length - 1).substring(1);
      }
    }

    return encoded;
  }
}
