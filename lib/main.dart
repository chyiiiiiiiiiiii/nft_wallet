import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'core/initialization.dart';
import 'pages/begin/presentation/pages/begin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: const BeginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
  );
}
