/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';
import 'package:test/test.dart';

void main() {
  group('Convert test:', () {
    test('str [yyyy-MM-dd] to datetime', () {
      final actual = '2022-11-07'.toDateTime();
      final matcher = DateTime(2022, 11, 7);
      expect(actual, matcher);
    });

    test('str [yyyy-MM-dd mm:hh:ss] to datetime', () {
      final actual = '2022-11-07 17:37:12'.toDateTime();
      final matcher = DateTime(2022, 11, 7, 17, 37, 12);
      expect(actual, matcher);
    });

    test('str [yyyy-MM-dd mm:hh:ss.SSS] to datetime', () {
      final actual = '2022-11-07 17:37:12.123'.toDateTime();
      final matcher = DateTime(2022, 11, 7, 17, 37, 12, 123);
      expect(actual, matcher);
    });

    test('str [yyyy-MM-dd mm:hh:ss.SSSSSS] to datetime', () {
      final actual = '2022-11-07 17:37:12.123456'.toDateTime();
      final matcher = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(actual, matcher);
    });

    test('str [yyyy-MM-dd] to datetime', () {
      final dt = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(dt.toStrDate(), '2022-11-07');
    });

    test('str [yyyy-MM-dd hh:mm] to datetime', () {
      final dt = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(dt.toStr(format: 'yyyy-MM-dd hh:mm'), '2022-11-07 17:37');
    });

    test('str [yyyy-MM-dd hh:mm:ss] to datetime', () {
      final dt = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(dt.toStrDateTime(), '2022-11-07 17:37:12');
    });

    test('str [yyyy-MM-dd hh:mm:ss.SSS] to datetime', () {
      final dt = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(dt.toStr(format: 'yyyy-MM-dd hh:mm:ss.SSS'), '2022-11-07 17:37:12.123');
    });

    test('str [yyyy-MM-dd hh:mm:ss.SSSSSS] to datetime', () {
      final dt = DateTime(2022, 11, 7, 17, 37, 12, 123, 456);
      expect(dt.toStr(format: 'yyyy-MM-dd hh:mm:ss.SSSSSS'), '2022-11-07 17:37:12.123456');
    });
  });
}
