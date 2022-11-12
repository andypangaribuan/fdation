/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:decimal/decimal.dart';
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

    test('decimal 1', () {
      final d1 = Decimal.parse('1');
      final d2 = Decimal.parse('3');
      final d = d1 / d2;
      if (!d.hasFinitePrecision) {
        final dd = d.toDecimal(scaleOnInfinitePrecision: 50);
        print('dd1 : $dd');
      }
      print(d.hasFinitePrecision);
      final dd = d.toDecimal(scaleOnInfinitePrecision: 1);
      print('d : $d');
      print('dd2 : $dd');
      expect('a', 'a');
    });

    test('length', () {
      expect(lines.length, 7);
    });
  });
}

String shortenName(String name) {
  name = name.trim();
  if (name.isEmpty) {
    return 'Unknown';
  }

  const doubleSpace = '  ';
  const singleSpace = ' ';
  const maxChar = 10;
  const minChar = 2;
  var shortenName = '';

  while (name.contains(doubleSpace)) {
    name = name.replaceAll(doubleSpace, singleSpace);
  }

  if (name.length <= maxChar) {
    return name;
  }

  final words = name.split(singleSpace);
  for (final word in words) {
    if (shortenName.isEmpty) {
      shortenName = word;
      continue;
    }

    final name = '$shortenName $word';
    if (name.length > maxChar) {
      if (shortenName.length < minChar) {
        shortenName = name;
      }
      break;
    }

    shortenName = name;
  }

  if (shortenName.length > maxChar) {
    shortenName = '${shortenName.substring(0, maxChar-3)}...';
  }

  return shortenName;
}



String shortenName2(String fullName) {
  const maxCharacter = 10;
  const minCharacter = 2;
  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return fullName = 'Unknown';
  }

  var listName = fullName.split(' ');
  var shortenName = '';
  var charCount = 0;
  for (var name in listName) {
    if (name.isEmpty) {
      continue;
    }

    if (charCount >= maxCharacter) {
      break;
    }

    var nameLength = name.length;
    if (nameLength <= maxCharacter && charCount + nameLength <= maxCharacter) {
      shortenName += '$name ';
      charCount += nameLength + 1;
    }
  }

  if (shortenName == '' || shortenName.trim().length <= minCharacter) {
    return '${fullName.substring(0, maxCharacter - 3)}...';
  }

  return shortenName;
}
