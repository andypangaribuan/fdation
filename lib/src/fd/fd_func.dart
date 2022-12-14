/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

abstract class FDFunc {
  bool isTypeOf<ThisType, OfType>();

  int getRandomInt({int min = 0, int max = 9, int? count});
  String getRandomStr({required int count, bool withLowerCase = false, bool withUpperCase = false, bool withNumber = false});

  String generateUniqueId();
  String generateLongUniqueId();
}
