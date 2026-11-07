import 'package:flutter/material.dart';
import 'package:quite_simple_chat/app/pages.dart';
import 'package:quite_simple_chat/app/pages/dm/dm_view.dart';
import 'package:quite_simple_chat/app/pages/dm_chat/dm_chat_view.dart';
import 'package:quite_simple_chat/app/pages/groups/groups_view.dart';
import 'package:quite_simple_chat/app/pages/main_page/main_view.dart';
import 'package:quite_simple_chat/app/pages/spaces/spaces_view.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;

  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final Map args = settings.arguments as Map;

    switch (settings.name) {
      case Pages.mainPage:
        return _buildRoute(settings, MainPage());
      case Pages.groupsList:
        return _buildRoute(settings, GroupsPage());
      case Pages.dmChat:
        return _buildRoute(settings, DmChatPage(chatName: args["chat_name"],chatId: args["chat_id"]));
      case Pages.dmList:
        return _buildRoute(settings, DmPage());
      case Pages.spacesList:
        return _buildRoute(settings, SpacesPage());
      default:
        return _buildRoute(settings, MainPage());
    }
  }

  MaterialPageRoute<dynamic> _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
        settings: settings,
        builder:(BuildContext ctx) => builder,
    );
  }
}