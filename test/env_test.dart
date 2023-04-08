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
  // group('Env test:', () {
  //   setUp(() async {
  //     await fd.env.load([envFilePath]);
  //   });

  //   test('string value', () {
  //     expect(fd.env.get<String>('APP_NAME'), 'fdation2');
  //   });

  //   test('string value with single quotes', () {
  //     expect(fd.env.get<String>('APP_INFO'), 'Dart Foundation');
  //   });

  //   test('string value with double quotes', () {
  //     expect(fd.env.get<String>('APP_DESC'), 'Base foundation for all dart/flutter application');
  //   });

  //   test('int value', () {
  //     expect(fd.env.get<int>('APP_PORT'), 8080);
  //   });

  //   test('double value', () {
  //     expect(fd.env.get<double>('APP_ID'), 10.01);
  //   });

  //   test('boolean value', () {
  //     expect(fd.env.get<bool>('APP_TRUST'), true);
  //   });
  // });

  // (1000 - (100 + 0)) / 9 -> 100
  // final w1 = calculateProperWrapWidth(minWidth: 100, totalContent: 1, spacing: 20, widthReduction: 100);
  // final w1e = (1000.0 - (100.0 + 0)) / 1;

  // final w2 = calculateProperWrapWidth(minWidth: 100, totalContent: 2, spacing: 20, widthReduction: 100);
  // final w2e = (1000.0 - (100.0 + 20)) / 2;
  // ---100---|---440---|---20---|---440--- -> 1000

  final w3 = calculateProperWrapWidth(minWidth: 150, totalContent: 4, spacing: 20, widthReduction: 360);
  final w3e = (1000.0 - (360.0 + 60)) / 4;
  // ---360---|---200---|---20---|---200---|---20---|---200--- -> 1000
  print(w3e);
}

double calculateProperWrapWidth({
  required double minWidth,
  required int totalContent,
  required double spacing,
  required double widthReduction,
}) {
  double screenWidth = 1000.0;
  double space = totalContent < 2 ? 0.0 : (totalContent - 1) * spacing;
  double availableWidth = screenWidth - space - widthReduction;
  availableWidth = availableWidth < 0 ? 0 : availableWidth;
  final maxContent = (availableWidth / minWidth).floor();

  if (maxContent == 0) {
    return availableWidth < 0 ? 0 : availableWidth;
  }

  return availableWidth / totalContent;
}
