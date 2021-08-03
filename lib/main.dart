import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  await initializeParse();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'W27JHgG5oJrGYzfy116EuMCzRGlDBvZwR56srDrv',
    'https://parseapi.back4app.com/',
    clientKey: 'ad2XQE4TCeJTNXE0m83RtbH7XqSWJEP6iM2jj8Ef',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
