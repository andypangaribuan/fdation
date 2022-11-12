/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

extension ExtMap<K, V> on Map<K, V> {
  void loop(void Function(K key, V val) action) {
    for (final e in entries) {
      action(e.key, e.value);
    }
  }

  Map<K, V> add(K key, V value) {
    this[key] = value;
    return this;
  }
}

extension NExtMap<K, V> on Map<K, V>? {
  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNotEmpty => !isEmpty;
}

extension ExtMapStrKey<T> on Map<String, T> {
  T? get(String key, {bool ignoreCase = false}) {
    var val = this[key];
    if (!ignoreCase || containsKey(key)) {
      return val;
    }

    key = key.toLowerCase();
    for (final e in entries) {
      if (key == e.key.toLowerCase()) {
        val = e.value;
        break;
      }
    }

    return val;
  }
}
