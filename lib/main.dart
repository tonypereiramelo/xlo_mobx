import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/catergory_repository.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocatiors();
  runApp(MyApp());
}

void setupLocatiors() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'W27JHgG5oJrGYzfy116EuMCzRGlDBvZwR56srDrv',
    'https://parseapi.back4app.com/',
    clientKey: 'ad2XQE4TCeJTNXE0m83RtbH7XqSWJEP6iM2jj8Ef',
    autoSendSessionId: true,
    debug: true,
  );

  final categories = await CategoryRepository().getList();
  print(categories);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.purple,
          elevation: 0,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.orange,
        ),
      ),
      home: BaseScreen(),
    );
  }
}
