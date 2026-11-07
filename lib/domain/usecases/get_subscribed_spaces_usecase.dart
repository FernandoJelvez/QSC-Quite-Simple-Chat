import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/domain/repositories/chat_repository.dart';

import '../entities/chat.dart';

class GetSubscribedSpacesUsecase extends UseCase<GetSubscribedSpacesResponse,GetSubscribedSpacesParams> {
  ChatRepository repository;
  final Logger _logger;
  GetSubscribedSpacesUsecase(this.repository) : _logger = Logger("GetSubscribedSpacesUsecase");

  @override
  Future<Stream<GetSubscribedSpacesResponse>> buildUseCaseStream(params) async {
    final controller = StreamController<GetSubscribedSpacesResponse>();

    try {
      final List<Chat> subscribedSpaces = await repository.getSubscribedSpacesList();
      controller.add(GetSubscribedSpacesResponse(subscribedSpaces));
      _logger.finest("getSubscribedSpacesList executed successfully");
      controller.close();
    } catch (error) {
      _logger.warning("getSubscribedSpacesList executed with error");
      controller.addError(error);
    }
    return controller.stream;
  }
}

class GetSubscribedSpacesParams {
  GetSubscribedSpacesParams();
}
class GetSubscribedSpacesResponse {
  List<Chat> subscribedSpaces;
  GetSubscribedSpacesResponse(this.subscribedSpaces);
}