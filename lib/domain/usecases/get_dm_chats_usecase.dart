import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';

import '../entities/chat.dart';
import '../repositories/chat_repository.dart';

class GetDmChatsUsecase
  extends UseCase<GetDmChatsUsecaseResponse, GetDmChatsUsecaseParams>{
  final ChatRepository chatRepository;
  
  final _logger;
  GetDmChatsUsecase(this.chatRepository) : _logger = Logger('GetDmChatsUsecase');
  
  @override
  Future<Stream<GetDmChatsUsecaseResponse>> buildUseCaseStream(
      GetDmChatsUsecaseParams? params) async
  {
    final controller = StreamController<GetDmChatsUsecaseResponse>();

    try {
      print("executing usecase");
      final List<Chat> dmChats = await chatRepository.getDmChatList();
      controller.add(GetDmChatsUsecaseResponse(dmChats));
      controller.close();
    } catch (e){
      controller.addError(e);
    }
    return controller.stream;
  }

}

class GetDmChatsUsecaseParams {
  final String id;
  GetDmChatsUsecaseParams(this.id);
}

class GetDmChatsUsecaseResponse {
  final List<Chat> dmChats;
  GetDmChatsUsecaseResponse(this.dmChats);
}