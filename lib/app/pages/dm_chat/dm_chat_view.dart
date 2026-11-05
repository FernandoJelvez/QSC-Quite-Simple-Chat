import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages/dm_chat/dm_chat_controller.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_message_repository.dart';

class DmChatPage extends CleanView{
  final String chatName;
  final String chatId;
  DmChatPage({Key? key, required this.chatName, required this.chatId}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState(chatName,chatId);

}

class _DmPageState extends CleanViewState<DmChatPage, DmChatController>{
  String chatName;
  _DmPageState(this.chatName, String chatId) : super(DmChatController(DataMockMessageRepository(), chatId: chatId));

  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: Text(chatName), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange),
      body: Center(
        child: ControlledWidgetBuilder<DmChatController>(
            builder: (context,controller) {
              List<Widget> dmChats = controller.returnedMsg();
              return ListView(
                  children: dmChats
              );
            }
        ),
      ),
    );
  }

}