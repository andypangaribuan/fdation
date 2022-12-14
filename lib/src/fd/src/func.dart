/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd_maker;

class _IsInstanceTypeOf<T> {}

class _Func implements FDFunc {
  final _random = Random();
  late final String _lowerAlphabet;
  late final String _upperAlphabet;
  late final String _numeric;

  _Func() {
    String lowerAlphabet = '';
    int c = "a".codeUnitAt(0);
    int end = "z".codeUnitAt(0);
    while (c <= end) {
      lowerAlphabet += String.fromCharCode(c);
      c++;
    }

    _lowerAlphabet = lowerAlphabet;
    _upperAlphabet = _lowerAlphabet.toUpperCase();

    String numeric = '';
    c = "0".codeUnitAt(0);
    end = "9".codeUnitAt(0);
    while (c <= end) {
      numeric += String.fromCharCode(c);
      c++;
    }

    _numeric = numeric;
  }

  @override
  bool isTypeOf<ThisType, OfType>() => _IsInstanceTypeOf<ThisType>() is _IsInstanceTypeOf<OfType>;

  @override
  int getRandomInt({int min = 0, int max = 9, int? count}) {
    if (count == null) {
      if (max <= min) {
        return 0;
      }

      return min + _random.nextInt(max - min);
    }

    if (count <= 0) {
      return 0;
    }

    String val = '';
    for (int i=0; i<count; i++) {
      val += _random.nextInt(10).toString();
      if (val == '0') {
        val = '';
        i--;
      }
    }

    return int.parse(val);
  }

  @override
  String getRandomStr({required int count, bool withLowerCase = false, bool withUpperCase = false, bool withNumber = false}) {
    if (count < 1) {
      return '';
    }

    String words = '';

    if (withLowerCase) {
      words += _lowerAlphabet;
    }
    if (withUpperCase) {
      words += _upperAlphabet;
    }
    if (withNumber) {
      words += _numeric;
    }

    final wordsLength = words.length;
    if (wordsLength == 0) {
      return '';
    }

    String val = '';
    for (int i=0; i<count; i++) {
      final index = getRandomInt(min: 0, max: wordsLength - 1);
      val += words.substring(index, index + 1);
    }

    return val;
  }
  
  @override
  String generateUniqueId() {
    final dateNowUtc = DateTime.now().toUtc();
    var uid = dateNowUtc.microsecondsSinceEpoch.toString();
    uid += '.';
    uid += fd.func.getRandomStr(count: 5, withNumber: true);
    uid += '.';
    uid += fd.func.getRandomStr(count: 7, withLowerCase: true);
    return uid;
  }
  
  @override
  String generateLongUniqueId() {
    var uid = generateUniqueId();
    uid += '.';
    uid += fd.func.getRandomStr(count: 19, withLowerCase: true, withUpperCase: true, withNumber: true);
    return uid;
  }
}
