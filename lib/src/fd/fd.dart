/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library fd;

import 'dart:convert';
import 'dart:io';

import 'package:fdation/fdation.dart';

part 'src/convert.dart';
part 'src/env.dart';
part 'src/file.dart';
part 'src/func.dart';
part 'src/json.dart';

final fd = _FD();

class _FD {
  final convert = _Convert();
  final env = _Env();
  final file = _File();
  final func = _Func();
  final json = _Json();
}
