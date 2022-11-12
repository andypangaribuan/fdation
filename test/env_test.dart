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
  group('Env test:', () {
    setUp(() async {
      await fd.env.load([envFilePath]);
    });

    test('string value', () {
      expect(fd.env.get<String>('APP_NAME'), 'fdation2');
    });

    test('string value with single quotes', () {
      expect(fd.env.get<String>('APP_INFO'), 'Dart Foundation');
    });

    test('string value with double quotes', () {
      expect(fd.env.get<String>('APP_DESC'), 'Base foundation for all dart/flutter application');
    });

    test('int value', () {
      expect(fd.env.get<int>('APP_PORT'), 8080);
    });

    test('double value', () {
      expect(fd.env.get<double>('APP_ID'), 10.01);
    });

    test('boolean value', () {
      expect(fd.env.get<bool>('APP_TRUST'), true);
    });
  });
}
