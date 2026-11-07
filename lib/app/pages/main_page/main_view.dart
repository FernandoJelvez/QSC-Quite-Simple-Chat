import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'main_controller.dart';

class MainPage extends CleanView {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends CleanViewState<MainPage,MainController> {
  _MainPageState() : super(MainController());
  @override
  Widget get view {
    return ControlledWidgetBuilder<MainController>(
      builder: (BuildContext context, MainController controller){
        return Scaffold(
          body: controller.widgetOptions.elementAt(controller.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                controller.optionMenu(Icons.message, controller.selectedIndex==0,"DM"),
                controller.optionMenu(Icons.groups, controller.selectedIndex==1,"Groups"),
                controller.optionMenu(Icons.forum, controller.selectedIndex==2,"Spaces")
              ],
            onTap: controller.onItemTapped,
          ),
        );
      }
    );
  }

}