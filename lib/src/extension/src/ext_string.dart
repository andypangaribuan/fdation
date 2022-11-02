/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

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
