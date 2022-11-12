/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of global_async;

class GroupWait2<T1, T2> {
  final T1 v1;
  final T2 v2;

  GroupWait2._(this.v1, this.v2);

  bool get isAllHaveValue {
    dynamic d1 = v1;
    dynamic d2 = v2;

    var allHaveValue = d1 != null && d2 != null;
    if (allHaveValue && d1 is List) {
      allHaveValue = d1.isNotEmpty;
    }
    if (allHaveValue && d1 is Map) {
      allHaveValue = d1.isNotEmpty;
    }
    if (allHaveValue && d2 is List) {
      allHaveValue = d2.isNotEmpty;
    }
    if (allHaveValue && d2 is Map) {
      allHaveValue = d2.isNotEmpty;
    }

    return allHaveValue;
  }
}
