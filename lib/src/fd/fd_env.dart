/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

abstract class FDEnv {
  Future<void> load(List<String> args);

  T? get<T>(String key, {T? defaultValue});
}
