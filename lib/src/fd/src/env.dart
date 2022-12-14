/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd_maker;

class _Env implements FDEnv {
  final _values = <String, String>{};

  @override
  Future<void> load(List<String> args) async {
    var filePath = '';

    for (var arg in args) {
      if (arg.contains(".env")) {
        filePath = arg;
        break;
      }
    }

    if (filePath.isNotEmpty) {
      final lines = await fd.file.read(path: filePath);
      for (final l in lines) {
        final line = l.trim();
        if (line.isEmpty || line.substring(0, 1) == '#') {
          continue;
        }

        final idx = line.indexOf("=");
        if (idx > 0) {
          final key = line.substring(0, idx);
          final value = line.substring(idx + 1);
          _values[key] = value;
        }
      }
    }
  }

  @override
  T? get<T>(String key, {T? defaultValue}) {
    var val = _values[key] ?? Platform.environment[key];
    if (val.isEmpty) {
      return defaultValue;
    }

    if (T == String) {
      if (val != null && val.length > 2) {
        final singleQuotes = "'";
        final doubleQuotes = '"';
        if ((val.substring(0, 1) == singleQuotes && val.substring(val.length - 1) == singleQuotes) ||
            (val.substring(0, 1) == doubleQuotes && val.substring(val.length - 1) == doubleQuotes)) {
          val = val.substring(0, val.length - 1);
          val = val.substring(1);
        }
      }
      return val as T;
    }

    if (T == int) {
      return val.toInt(defaultValue: defaultValue as int?) as T?;
    }

    if (T == double) {
      return val.toDouble(defaultValue: defaultValue as double?) as T?;
    }

    if (T == bool) {
      return val.toBool(defaultValue: defaultValue as bool?) as T?;
    }

    return val as T;
  }
}
