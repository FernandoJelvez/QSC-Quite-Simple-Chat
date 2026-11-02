import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/mock/data_mock_group_chat_repository.dart';
import 'groups_controller.dart';

class GroupsPage extends CleanView {

  GroupsPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();

}

class _GroupPageState extends CleanViewState<GroupsPage,GroupsController> {
  _GroupPageState() : super(GroupsController(DataMockGroupChatRepository()));
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
    );
  }}