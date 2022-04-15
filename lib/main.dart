import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'pages/begin/begin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

void init() {
  // equatable model class will auto set stringify 'true', and have toString() to show content
  EquatableConfig.stringify = true;
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
      home: const BeginPage(),
    );
  }
}
