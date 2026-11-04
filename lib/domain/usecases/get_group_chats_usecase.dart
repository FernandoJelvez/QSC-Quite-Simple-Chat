import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/domain/repositories/chat_repository.dart';

import '../entities/chat.dart';

class GetGroupChatsUsecase extends UseCase<GetGroupChatsUsecaseResponse, GetGroupChatsUsecaseParams> {
  final ChatRepository repository;
  final _logger;
  GetGroupChatsUsecase(this.repository) : _logger = Logger("GetGroupChatsUsecase");

  @override
  Future<Stream<GetGroupChatsUsecaseResponse>> buildUseCaseStream(params) async {
    final controller = StreamController<GetGroupChatsUsecaseResponse>();

    try {
      final List<Chat> groupChats = await repository.getGroupChatList();
      _logger.finest("GetGroupChatsList executed successfully");
      controller.add(GetGroupChatsUsecaseResponse(groupChats));
      controller.close();
    } catch (error) {
      _logger.finest("GetGroupChatsList execution failed");
      controller.addError(error);
    }
    return controller.stream;
  }


}

class GetGroupChatsUsecaseParams {
  GetGroupChatsUsecaseParams();
}

class GetGroupChatsUsecaseResponse {
  final List<Chat> groupChats;
  GetGroupChatsUsecaseResponse(this.groupChats);
}