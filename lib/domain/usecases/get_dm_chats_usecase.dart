import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/domain/entities/dm_chat.dart';
import 'package:quite_simple_chat/domain/repositories/dm_repository.dart';

class GetDmChatsUsecase
  extends UseCase<GetDmChatsUsecaseResponse, GetDmChatsUsecaseParams>{
  final DmRepository dmRepository;
  
  final _logger;
  GetDmChatsUsecase(this.dmRepository) : _logger = Logger('GetDmChatsUsecase');
  
  @override
  Future<Stream<GetDmChatsUsecaseResponse>> buildUseCaseStream(
      GetDmChatsUsecaseParams? params) async
  {
    final controller = StreamController<GetDmChatsUsecaseResponse>();

    try {
      print("executing usecase");
      final List<DmChat> dmChats = await dmRepository.getDmChatList();
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
  final List<DmChat> dmChats;
  GetDmChatsUsecaseResponse(this.dmChats);
}