import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/app/pages/dm_chat/dm_chat_presenter.dart';
import 'package:quite_simple_chat/app/widget/chat_bubble.dart';

import '../../../data/repositories/mock/data_mock_message_repository.dart';
import '../../../domain/entities/message.dart';

class DmChatController extends Controller {
  List<Message> messages = <Message>[];
  final DmChatPresenter dmChatPresenter;
  final String chatId;
  final Logger _logger;

  DmChatController(DataMockMessageRepository messageRepository, {required this.chatId})
  : dmChatPresenter = DmChatPresenter(messageRepository), _logger=Logger("DmChatController"), super();

  @override
  void onInitState() {
    _logger.info("executing getDmChatMessages");
    dmChatPresenter.getDmChatMessages(chatId);
  }

  @override
  void initListeners() {
    dmChatPresenter.getDmChatMessageOnComplete = () {
      _logger.info("getDmChatMessageOnComplete completed");
    };
    dmChatPresenter.getDmChatMessageOnError = (e) {
    };
    dmChatPresenter.getDmChatMessageOnNext = (List<Message> response) {
      _logger.info("executing onNext");
      messages = response;
      refreshUI();
    };
  }

  List<Widget> returnedMsg() {
    if (messages.isNotEmpty) {
      List<Column> widgets = messages.map(
        (e)=> Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Align(
                    alignment: e.sender=="you"? Alignment.centerRight: Alignment.centerLeft,
                    child:ChatBubble(text: e.content!, received: e.sender=="you")),
                subtitle: Align(
                    alignment: e.sender=="you"? Alignment.centerRight: Alignment.centerLeft,
                    child: Text(e.sender!))),
          ],
        )
      ).toList();
      return widgets;
    } else {
      return List.empty();
    }
  }
}