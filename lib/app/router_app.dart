import 'package:flutter/material.dart';
import 'package:quite_simple_chat/app/pages.dart';
import 'package:quite_simple_chat/app/pages/dm/dm_view.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;

  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final Map args = settings.arguments as Map;

    switch (settings.name) {
      case Pages.mainPage:
        return _buildRoute(settings, DmPage());
      default:
        return _buildRoute(settings, DmPage());
    }
  }

  MaterialPageRoute<dynamic> _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
        settings: settings,
        builder:(BuildContext ctx) => builder,
    );
  }
}