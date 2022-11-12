/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';

extension ExtString on String {
  int? toInt({int? defaultValue}) => int.tryParse(this) ?? defaultValue;

  double? toDouble({double? defaultValue}) => double.tryParse(this) ?? defaultValue;

  bool? toBool({bool? defaultValue}) {
    switch (toLowerCase()) {
      case "true":
      case "1":
        return true;

      case "false":
      case "0":
        return false;

      default:
        return defaultValue;
    }
  }

  Iterable<String> get iterable sync* {
    for (var i = 0; i < length; i++) {
      yield this[i];
    }
  }

  Iterable<MapEntry<int, String>> get entries sync* {
    for (var i = 0; i < length; i++) {
      yield MapEntry(i, this[i]);
    }
  }

  bool get hasInt {
    for (final c in iterable) {
      if (int.tryParse(c) != null) {
        return true;
      }
    }
    return false;
  }

  DateTime? toDateTime({String? format}) {
    return fd.convert.string2DateTime(this, format: format);
  }
}

extension NExtString on String? {
  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNotEmpty => !isEmpty;

  int? toInt({int? defaultValue}) {
    return this == null ? defaultValue : this!.toInt(defaultValue: defaultValue);
  }

  double? toDouble({double? defaultValue}) {
    return this == null ? defaultValue : this!.toDouble(defaultValue: defaultValue);
  }

  bool? toBool({bool? defaultValue}) {
    return this == null ? defaultValue : this!.toBool(defaultValue: defaultValue);
  }
}
