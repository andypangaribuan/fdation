/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdation/fdation.dart';
import 'package:test/test.dart';

void main() {
  group('Json test:', () {
    final user = User(
      id: 1,
      name: 'AP',
      address: 'FT',
      age: 30,
      bank: Bank(
        id: 100,
        name: 'BTC',
        accountNumber: '123456',
      ),
    );

    final users = [user, user];

    test('serialize null variable', () {
      final encoded = fd.json.serialize(null);
      expect(encoded, 'null');
    });

    test('serialize string variable', () {
      final encoded = fd.json.serialize('ok');
      expect(encoded, '"ok"');
    });

    test('serialize int variable', () {
      final encoded = fd.json.serialize(1);
      expect(encoded, '1');
    });

    test('serialize double variable', () {
      final encoded = fd.json.serialize(1.54321);
      expect(encoded, '1.54321');
    });

    test('serialize bool variable', () {
      final encoded = fd.json.serialize(false);
      expect(encoded, 'false');
    });

    test('serialize map variable', () {
      final encoded = fd.json.serialize({'id': 1, 'name': 'andy', 'isActive': true, 'carId': null});
      final expected = """
{"id":1,"name":"andy","isActive":true,"carId":null}
""";
      expect(encoded, expected.trim());
    });

    test('serialize single model', () {
      final encoded = fd.json.serialize(user);
      final expected = """
{"id":1,"name":"AP","address":"FT","age":30,"i1":null,"bank":{"id":100,"name":"BTC","accountNumber":"123456"}}
""";
      expect(encoded, expected.trim());
    });

    test('serialize list model', () {
      final encoded1 = fd.json.serialize(users);
      final expected1 = """
[
{"id":1,"name":"AP","address":"FT","age":30,"i1":null,"bank":{"id":100,"name":"BTC","accountNumber":"123456"}},
{"id":1,"name":"AP","address":"FT","age":30,"i1":null,"bank":{"id":100,"name":"BTC","accountNumber":"123456"}}
]
""";
      expect(encoded1, expected1.replaceAll('\n', '').trim());
    });
  });
}

// String _jsonEncode(Object? data) => const JsonEncoder.withIndent(' ').convert(data);

class User extends FJsonSerializable {
  int id;
  String name;
  String? address;
  int? age;
  String? s1;
  int? i1;
  Bank bank;

  User({
    required this.id,
    required this.name,
    this.address,
    this.age,
    this.s1,
    this.i1,
    required this.bank,
  });

  @override
  Map<String, dynamic> serialize() {
    final keys = ['age', 's1'];
    return omitempty(keys, {
      'id': id,
      'name': name,
      'address': address,
      'age': age,
      's1': s1,
      'i1': i1,
      'bank': bank.serialize(),
    });
  }
}

class Bank extends FJsonSerializable {
  int id;
  String name;
  String? accountNumber;
  int? size;

  Bank({
    required this.id,
    required this.name,
    this.accountNumber,
    this.size,
  });

  @override
  Map<String, dynamic> serialize() {
    final keys = ['accountNumber', 'size'];
    return omitempty(keys, {
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
      'size': size,
    });
  }
}
