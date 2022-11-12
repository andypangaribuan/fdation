/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

extension ExtList<T> on List<T> {
  Iterable<MapEntry<int, T>> get entries => asMap().entries;

  T? safeFirstWhere(bool Function(T e) condition, {T Function()? orElse}) {
    for (T e in this) {
      if (condition(e)) {
        return e;
      }
    }

    return orElse?.call();
  }

  List<X> loopToList<X>(X Function(T e) action) {
    final ls = <X>[];
    for (T e in this) {
      ls.add(action(e));
    }

    return ls;
  }

  void loop(void Function(T item, int idx) action) {
    for (int i = 0; i < length; i++) {
      action(this[i], i);
    }
  }
}
