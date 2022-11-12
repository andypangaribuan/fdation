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
}
