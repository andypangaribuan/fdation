/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd_maker;

class _Convert implements FDConvert {
  final _dateTimeConverter = _DateTimeConverter();

  @override
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

  @override
  DateTime? string2DateTime(String value, {String? format}) {
    return _dateTimeConverter.toDateTime(value, format: format);
  }

  @override
  String? dateTime2String(DateTime value, {String? format}) {
    return _dateTimeConverter.toStr(value, format: format);
  }
}

class _DateTimeConverter {
  DateTime? toDateTime(String value, {String? format}) {
    var dtv = DateTime.tryParse(value);
    if (dtv != null) {
      return dtv;
    }

    return null;
  }

  String? toStr(DateTime dt, {String? format}) {
    // 2022-11-07T17:37:12.123456
    final sp = _DateTimeSplitter.fromDateTime(dt);
    return format == null ? sp.iso8601 : sp.strFormat(format);
  }
}

class _DateTimeSplitter {
  String iso8601 = '';
  String year = '1000';
  String month = '01';
  String day = '01';
  String hour = '00';
  String minute = '00';
  String second = '00';
  String microSecond = '000000';

  _DateTimeSplitter();

  factory _DateTimeSplitter.fromDateTime(DateTime dt) {
    final sp = _DateTimeSplitter();
    sp.iso8601 = dt.toIso8601String();

    final dts = sp.iso8601;
    var arr = dts.split('T');

    var ls = arr[0].split('-');
    sp.year = ls[0];
    sp.month = ls[1];
    sp.day = ls[2];

    arr = arr[1].split('.');

    ls = arr[0].split(':');
    sp.hour = ls[0];
    sp.minute = ls[1];
    sp.second = ls[2];

    sp.microSecond = arr[1];
    return sp;
  }

  String? strFormat(String format) {
    final formats = _formats(format);
    if (formats.isEmpty) {
      return null;
    }

    var formatted = '';
    for (final f in formats) {
      switch (f) {
        case 'yyyy':
          formatted += year;
          break;
        case 'MM':
          formatted += month;
          break;
        case 'dd':
          formatted += day;
          break;
        case 'hh':
          formatted += hour;
          break;
        case 'mm':
          formatted += minute;
          break;
        case 'ss':
          formatted += second;
          break;
        case 'S':
          formatted += microSecond.substring(0, 1);
          break;
        case 'SS':
          formatted += microSecond.substring(0, 2);
          break;
        case 'SSS':
          formatted += microSecond.substring(0, 3);
          break;
        case 'SSSS':
          formatted += microSecond.substring(0, 4);
          break;
        case 'SSSSS':
          formatted += microSecond.substring(0, 5);
          break;
        case 'SSSSSS':
          formatted += microSecond;
          break;
        default:
          formatted += f;
          break;
      }
    }

    return formatted;
  }

  List<String> _formats(String format) {
    final formats = <String>[];
    final validStr = {
      'y': null,
      'M': null,
      'd': null,
      'h': null,
      'm': null,
      's': null,
      'S': null,
      '-': null,
      ':': null,
      '.': null,
      'T': null,
      ' ': null,
    };

    var val = '';

    for (final v in format.iterable) {
      if (!validStr.containsKey(v)) {
        return [];
      }

      if (val == '') {
        val = v;
        continue;
      }

      if (val.substring(val.length - 1) == v) {
        val += v;
      } else {
        formats.add(val);
        val = v;
      }
    }

    if (val.isNotEmpty) {
      formats.add(val);
    }

    final validFormat = {
      'yyyy': null,
      'MM': null,
      'MMM': null,
      'dd': null,
      'hh': null,
      'mm': null,
      'ss': null,
      'S': null,
      'SS': null,
      'SSS': null,
      'SSSS': null,
      'SSSSS': null,
      'SSSSSS': null,
      '-': null,
      ':': null,
      '.': null,
      'T': null,
      ' ': null,
    };

    for (final f in formats) {
      if (!validFormat.containsKey(f)) {
        return [];
      }
    }

    return formats;
  }
}
