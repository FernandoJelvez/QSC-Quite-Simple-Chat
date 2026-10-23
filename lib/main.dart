// lib/main.dart
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
// Habilitamos los Logs
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
