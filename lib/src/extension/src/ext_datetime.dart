/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';

extension ExtDateTime on DateTime {
  String? toStr({String? format}) {
    return fd.convert.dateTime2String(this, format: format);
  }

  String? toStrDate() {
    return fd.convert.dateTime2String(this, format: 'yyyy-MM-dd');
  }

  String? toStrDateTime() {
    return fd.convert.dateTime2String(this, format: 'yyyy-MM-dd hh:mm:ss');
  }

  String toRFC3339() {
    return fd.convert.toRFC3339(this);
  }

  String toRFC3339MilliSecond() {
    return fd.convert.toRFC3339MilliSecond(this);
  }

  String toRFC3339MicroSecond() {
    return fd.convert.toRFC3339MicroSecond(this);
  }
}

extension NExtDateTime on DateTime? {
  String? toStr({String? format}) {
    return this == null ? null : this!.toStr(format: format);
  }

  String? toStrDate() {
    return this == null ? null : this!.toStrDate();
  }

  String? toStrDateTime() {
    return this == null ? null : this!.toStrDateTime();
  }

  String? safeToRFC3339() {
    return fd.convert.safeToRFC3339(this);
  }

  String? safeToRFC3339MilliSecond() {
    return fd.convert.safeToRFC3339MilliSecond(this);
  }

  String? safeToRFC3339MicroSecond() {
    return fd.convert.safeToRFC3339MicroSecond(this);
  }
}
