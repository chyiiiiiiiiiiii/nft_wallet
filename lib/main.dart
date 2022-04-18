import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/initialization.dart';
import 'pages/yii/yii_page.dart';

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
      title: 'TDD',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: const YiiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
