/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of fd_maker;

class _File implements FDFile {
  @override
  Future<List<String>> read({required String path}) {
    final f = File(path);
    return f.readAsLines();
  }
}
