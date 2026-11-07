import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/app/pages/spaces/spaces_presenter.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_chat_repository.dart';

import '../../../domain/entities/chat.dart';
import '../../utils/last_time_formater.dart';

class SpacesController extends Controller {
  List<Chat> subscribedSpaces = [];
  SpacesPresenter spacesPresenter;
  final Logger _logger;
  SpacesController(DataMockChatRepository repository) : spacesPresenter = SpacesPresenter(repository), _logger = Logger("SpacesController");

  @override
  void onInitState() {
    super.onInitState();
    spacesPresenter.getSubscribedSpaces();
  }

  @override
  void initListeners() {
    spacesPresenter.getSubscribedSpacesOnComplete = () {
      _logger.info("getSubscribedSpaces execution complete");
    };
    spacesPresenter.getSubscribedSpacesOnError = (e){
      _logger.warning("getSubscribedSpaces executed with errors");
    };
    spacesPresenter.getSubscribedSpacesOnNext = (response){
      subscribedSpaces = response;
      refreshUI();
    };
  }

  List<Widget> returnedMsg() {
    List<Column> widgets = subscribedSpaces.map(
        (e) => Column(
          children: <Widget>[
            ListTile(title: Text(e.name!), subtitle: Text("${e.lastMessenger}: ${e.lastMessage!}"),trailing: Text(LastTimeFormater.format(e.lastTime!))),
            Divider()
          ],
        )
    ).toList();
    return widgets;
  }
}