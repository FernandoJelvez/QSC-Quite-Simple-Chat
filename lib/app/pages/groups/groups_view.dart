import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/mock/data_mock_chat_repository.dart';
import '../../pages.dart';
import 'groups_controller.dart';

class GroupsPage extends CleanView {

  GroupsPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();

}

class _GroupPageState extends CleanViewState<GroupsPage,GroupsController> {
  _GroupPageState() : super(GroupsController(DataMockChatRepository()));
  int currentPageIndex = 1;
  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: const Text('Groups'), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange),
      body: Center(
        child: ControlledWidgetBuilder<GroupsController>(
            builder: (context,controller) {
              List<Widget> groupChats = controller.returnedMsg();
              return ListView(
                children: groupChats
              );
            }
        ),
      ),
      bottomNavigationBar:  NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(
                context, Pages.mainPage, arguments: {});
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