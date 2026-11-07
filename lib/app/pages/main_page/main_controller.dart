import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages/dm/dm_view.dart';
import 'package:quite_simple_chat/app/pages/groups/groups_view.dart';
import 'package:quite_simple_chat/app/pages/main_page/main_presenter.dart';
import 'package:quite_simple_chat/app/pages/spaces/spaces_view.dart';

class MainController extends Controller {
  int selectedIndex = 0;
  final MainPresenter mainPresenter;
  MainController() : mainPresenter=MainPresenter(),super();


  List<Widget> widgetOptions = [
    DmPage(),
    GroupsPage(),
    SpacesPage()
  ];

  @override
  void initListeners() {}

  void onItemTapped(int index){
    selectedIndex = index;
    refreshUI();
  }

  BottomNavigationBarItem optionMenu(IconData icon, bool selected,String label) {
    return BottomNavigationBarItem(icon: Icon(icon, color: selected? Colors.deepOrange : Colors.black54), label: label);
  }
}