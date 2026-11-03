import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages.dart';

import '../../../data/repositories/mock/data_mock_dm_chat_repository.dart';
import 'dm_controller.dart';

class DmPage extends CleanView {

  DmPage({Key? key}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();

}

class _DmPageState extends CleanViewState<DmPage,DmController> {
  _DmPageState() : super(DmController(DataMockDmChatRepository()));
  int currentPageIndex = 0;
  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: const Text('DM'), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange),
      body: Center(
        child: ControlledWidgetBuilder<DmController>(
            builder: (context,controller) {
              List<Widget> dmChats = controller.returnedMsg();
              return ListView(
                children: dmChats
              );
            }
        ),
      ),
      bottomNavigationBar:  NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(
                context, Pages.groupsList, arguments: {});
          }
        },
        selectedIndex: currentPageIndex,
        destinations: const<Widget>[
          NavigationDestination(icon: Icon(Icons.person), label: "dm"),
          NavigationDestination(icon: Icon(Icons.groups), label: "groups")
        ],
      ),
    );
  }}