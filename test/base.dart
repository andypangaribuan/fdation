/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'dart:io';

String get envFilePath {
  final dirPath = Directory.current.absolute.path;
  return '$dirPath/resources/local.env';
}
