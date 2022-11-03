/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';
import 'package:test/test.dart';

import 'base.dart';

void main() {
  group('File test:', () {
    final lines = <String>[];

    setUp(() async {
      if (lines.isEmpty) {
        final ls = await fd.file.read(path: envFilePath);
        lines.addAll(ls);
      }
    });

    test('length', () {
      expect(lines.length, 5);
    });
  });
}
