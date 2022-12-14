/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library fd_maker;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:fdation/fdation.dart';
import 'package:fdation/src/fd/fd_convert.dart';
import 'package:fdation/src/fd/fd_env.dart';
import 'package:fdation/src/fd/fd_file.dart';
import 'package:fdation/src/fd/fd_func.dart';
import 'package:fdation/src/fd/fd_json.dart';

part '../src/fd/impl.dart';

part '../src/fd/src/convert.dart';
part '../src/fd/src/env.dart';
part '../src/fd/src/file.dart';
part '../src/fd/src/func.dart';
part '../src/fd/src/json.dart';

FD makeFD() => _FD();
