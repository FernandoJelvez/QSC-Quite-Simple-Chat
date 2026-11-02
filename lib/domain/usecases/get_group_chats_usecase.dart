import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/domain/repositories/group_repository.dart';

import '../entities/group_chat.dart';

class GetGroupChatsUsecase extends UseCase<GetGroupChatsUsecaseResponse, GetGroupChatsUsecaseParams> {
  final GroupRepository repository;
  final _logger;
  GetGroupChatsUsecase(this.repository) : _logger = Logger("GetGroupChatsUsecase");

  @override
  Future<Stream<GetGroupChatsUsecaseResponse>> buildUseCaseStream(params) async {
    final controller = StreamController<GetGroupChatsUsecaseResponse>();

    try {
      final List<GroupChat> groupChats = await repository.getGroupChatList();
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
  final List<GroupChat> groupChats;
  GetGroupChatsUsecaseResponse(this.groupChats);
}