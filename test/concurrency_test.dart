/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'dart:async';

import 'package:fdation/fdation.dart';
import 'package:test/test.dart';

void main() async {
  late final FPool<DB> pool;
  pool = FPool<DB>(
    newInstance: () => DB(pool)..lifetime = Duration(seconds: 30),
    maxConcurrent: 0,
    maxIdle: 2,
    maxOpen: 4,
    openLifetime: Duration(seconds: 5),
  );

  doWrite(pool, 'A', [1, 2, 3, 4]);
  doWrite(pool, 'B', [1, 2]);
  doWrite(pool, 'C', [1, 2, 3, 4]);
  await doWrite(pool, 'D', [1, 2, 3, 4]);

  await Future.delayed(Duration(seconds: 33));
  print('${DateTime.now()} total instance: ${pool.totalInstances}');

  group('test:', () {
    test('concurrency', () {
      expect('ok', 'ok');
    });
  });
}

Future<void> doWrite(FPool<DB> pool, String key, List<int> ls) async {
  final db = await pool.instance;
  await db.write1234(key, ls);
}

class DB extends FPoolInstance {
  final FPool<DB> pool;

  DB(this.pool);

  Future writeSlow(String key, int value, bool isLast) async {
    print('${DateTime.now()} $key-$value');
    if (!isLast) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future write(String key, List<int> values) async {
    for (final e in values.entries) {
      await writeSlow(key, e.value, e.key == values.length - 1);
    }
  }

  Future write1234(String key, List<int> ls) async {
    await write(key, ls);
    release();
  }

  @override
  void dispose() {
    super.dispose();
    print('${DateTime.now()} instance dispose');
    print('${DateTime.now()} total instance: ${pool.totalInstances}');
  }
}
