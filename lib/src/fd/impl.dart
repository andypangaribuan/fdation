/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd_maker;

class _FD implements FD {
  late final _convert = _Convert();
  late final _env = _Env();
  late final _file = _File();
  late final _func = _Func();
  late final _json = _Json();

  @override
  FDConvert get convert => _convert;

  @override
  FDEnv get env => _env;

  @override
  FDFile get file => _file;

  @override
  FDFunc get func => _func;

  @override
  FDJson get json => _json;
}
