import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages/dm/dm_presenter.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_dm_chat_repository.dart';

import '../../../domain/entities/dm_chat.dart';

class DmController extends Controller {
  List<DmChat>? dmChats;
  final DmPresenter dmPresenter;

  DmController(DataMockDmChatRepository dataMockDmChatRepository)
  : dmPresenter = DmPresenter(dataMockDmChatRepository), super();

  @override
  void onInitState() {
    super.onInitState();
    dmPresenter.getDmChats("");
  }

  @override
  void initListeners() {
    dmPresenter.getDmChatsOnComplete = () {
      print("completed");
    };
    dmPresenter.getDmChatsOnError = (e) {};
    dmPresenter.getDmChatsOnNext = (List<DmChat> response) {
      dmChats = response;
      refreshUI();
    };
  }

  List<Widget> returnedMsg() {
    print("returning");
    if (dmChats!=null){
      List<Column> widgets = dmChats!.map(
          (e)=> Column(
            children: <Widget>[
              ListTile(leading: CircleAvatar(),title: Text(e.name!), subtitle: Text(e.lastMessage!),trailing: Text(e.lastTime!.toString()),),
              Divider(),
            ],
          )
      ).toList();
      return widgets;
    } else {
      print("returning empty");
      return List.empty();
    }
  }
}