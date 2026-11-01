// lib/main.dart
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/app/pages/dm/dm_view.dart';
import 'package:quite_simple_chat/app/router_app.dart';

void main() {
// Habilitamos los Logs
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  final RouterApp _router = RouterApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quite Simple Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: DmPage(),
      navigatorObservers: [_router.routeObserver],
      onGenerateRoute: _router.getRoute,
    );
  }
}
