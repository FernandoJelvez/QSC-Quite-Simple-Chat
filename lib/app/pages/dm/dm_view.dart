import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/mock/data_mock_dm_chat_repository.dart';
import 'dm_controller.dart';

class DmPage extends CleanView {

  DmPage({Key? key}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();

}

class _DmPageState extends CleanViewState<DmPage,DmController> {
  _DmPageState() : super(DmController(DataMockDmChatRepository()));
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
    );
  }}