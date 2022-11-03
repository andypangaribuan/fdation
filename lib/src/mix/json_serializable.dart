/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library mix_json;

import 'package:meta/meta.dart';

part 'src/json_serializable_impl.dart';

abstract class FJsonSerializable {
  // supported value: string, int, double, bool, datetime
  Map<String, dynamic> serialize();

  @protected
  Map<String, dynamic> omitempty(List<String> keys, Map<String, dynamic> serial) => _omitempty(keys, serial);
}
