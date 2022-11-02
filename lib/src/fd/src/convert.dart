/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd;

class _Convert {
  T? to<T>(dynamic val, {T? defaultValue}) {
    if (val == null) {
      return defaultValue;
    }

    if (T == String) {
      if (val is String) {
        return val as T;
      }

      return val.toString() as T;
    }

    if (T == int) {
      if (val is String) {
        final dv = defaultValue as int?;
        return val.toInt(defaultValue: dv) as T?;
      }
      if (val is int) {
        return val as T;
      }
      if (val is double) {
        return val.toInt() as T;
      }
      if (val is bool) {
        return (val ? 1 : 0) as T;
      }
    }

    if (T == double) {
      if (val is String) {
        final dv = defaultValue as double?;
        return val.toDouble(defaultValue: dv) as T?;
      }
      if (val is int) {
        return val.toDouble() as T;
      }
      if (val is double) {
        return val as T;
      }
      if (val is bool) {
        return (val ? 1 : 0) as T;
      }
    }

    if (T == bool) {
      if (val is String) {
        switch (val.trim().toLowerCase()) {
          case 'true':
          case '1':
            return true as T;

          case 'false':
          case '0':
            return false as T;

          default:
            return defaultValue;
        }
      }

      if (val is int || val is double) {
        final dv = defaultValue as bool?;
        return (val == 1
            ? true
            : val == 0
                ? false
                : dv) as T?;
      }
    }

    if (T == DateTime) {
      if (val is DateTime) {
        return val as T;
      }

      return defaultValue;
    }

    return val;
  }
}
