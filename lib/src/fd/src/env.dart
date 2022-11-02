/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd;

class _Env {
  final _values = <String, String>{};

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

  T? get<T>(String key, {T? defaultValue}) {
    final val = _values[key] ?? Platform.environment[key];
    if (val.isEmpty) {
      return defaultValue;
    }

    if (T == String) {
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
