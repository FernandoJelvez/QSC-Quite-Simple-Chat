import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages/groups/groups_presenter.dart';
import 'package:quite_simple_chat/app/utils/last_time_formater.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_chat_repository.dart';

import '../../../domain/entities/chat.dart';

class GroupsController extends Controller {
  List<Chat>? groupChats;
  final GroupsPresenter groupPresenter;

  GroupsController(DataMockChatRepository dataMockGroupChatRepository)
  : groupPresenter = GroupsPresenter(dataMockGroupChatRepository), super();

  @override
  void onInitState() {
    super.onInitState();
    groupPresenter.getGroupChats("");
  }

  @override
  void initListeners() {
    groupPresenter.getGroupChatsOnComplete = () {
      print("completed");
    };
    groupPresenter.getGroupChatsOnError = (e) {};
    groupPresenter.getGroupChatsOnNext = (List<Chat> response) {
      groupChats = response;
      refreshUI();
    };
  }

  List<Widget> returnedMsg() {
    if (groupChats!=null){
      List<Column> widgets = groupChats!.map(
          (e)=> Column(
            children: <Widget>[
              ListTile(leading: CircleAvatar(),title: Text(e.name!), subtitle: Text("${e.lastMessenger}: ${e.lastMessage!}"),trailing: Text(LastTimeFormater.format(e.lastTime!))),
              Divider(),
            ],
          )
      ).toList();
      return widgets;
    } else {
      return List.empty();
    }
  }
}