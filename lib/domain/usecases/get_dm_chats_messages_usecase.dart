import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/domain/entities/message.dart';

import '../repositories/message_repository.dart';

class GetDmChatMessagesUsecase
    extends UseCase<GetDmChatMessagesResponse,GetDmChatMessagesParams>{
  final MessageRepository repository;
  final Logger _logger;
  GetDmChatMessagesUsecase(this.repository) : _logger = Logger("GetDmChatMessagesUsecase");

  @override
  Future<Stream<GetDmChatMessagesResponse?>> buildUseCaseStream(GetDmChatMessagesParams? params) async {
    final controller = StreamController<GetDmChatMessagesResponse>();
    try {
      final List<Message> messages = await repository.getChatMessages(id: params!.chatId!);
      _logger.finest("getChatMessages executed successfully");
      controller.add(GetDmChatMessagesResponse(messages));
      controller.close();
    } catch (error) {
      _logger.warning("getChatMessages failed to execute");
      controller.addError(error);
    }
    return controller.stream;
  }

}

class GetDmChatMessagesResponse {
  List<Message> messages;
  GetDmChatMessagesResponse(this.messages);
}

class GetDmChatMessagesParams {
  String? chatId;
  GetDmChatMessagesParams(this.chatId);
}