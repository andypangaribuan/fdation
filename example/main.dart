import 'package:fdation/fdation.dart';

import 'base.dart';

void main() async {
  await fd.env.load([envFilePath]);
  final appName = fd.env.get<String>('APP_NAME');
  final appPort = fd.env.get<int>('APP_PORT');
  final appId = fd.env.get<double>('APP_ID');
  final appTrust = fd.env.get<bool>('APP_TRUST');

  print('app-name: $appName');
  print('app-port: $appPort');
  print('app-id: $appId');
  print('app-trust: $appTrust');
}
