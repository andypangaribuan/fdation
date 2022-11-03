/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/maker/fd_maker.dart';

import 'fd_convert.dart';
import 'fd_env.dart';
import 'fd_file.dart';
import 'fd_func.dart';
import 'fd_json.dart';

final fd = makeFD();

abstract class FD {
  FDConvert get convert;
  FDEnv get env;
  FDFile get file;
  FDFunc get func;
  FDJson get json;
}
