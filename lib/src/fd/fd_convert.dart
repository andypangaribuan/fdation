/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

abstract class FDConvert {
  T? to<T>(dynamic val, {T? defaultValue});

  DateTime? string2DateTime(String value, {String? format});
  String? dateTime2String(DateTime value, {String? format});
}
