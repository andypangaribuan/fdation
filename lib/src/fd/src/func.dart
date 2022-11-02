/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd;

class _IsInstanceTypeOf<T> {}

class _Func {
  bool isTypeOf<ThisType, OfType>() => _IsInstanceTypeOf<ThisType>() is _IsInstanceTypeOf<OfType>;
}
