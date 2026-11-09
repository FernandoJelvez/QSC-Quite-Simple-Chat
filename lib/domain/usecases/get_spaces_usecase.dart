import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';

import '../entities/chat.dart';
import '../repositories/chat_repository.dart';

class GetSpacesUsecase extends UseCase<GetSpacesUsecaseResponse,GetSpacesUsecaseParams>{
  final ChatRepository repository;
  final Logger _logger;

  GetSpacesUsecase(this.repository) : _logger = Logger("GetSpacesUsecase");

  @override
  Future<Stream<GetSpacesUsecaseResponse?>> buildUseCaseStream(GetSpacesUsecaseParams? params) async {
    final controller = StreamController<GetSpacesUsecaseResponse>();
    try {
      List<Chat> spaces = await repository.getSpacesList();
      controller.add(GetSpacesUsecaseResponse(spaces));
      _logger.finest("GetSpaces executed successfully");
      controller.close();
    } catch (error) {
      controller.addError(error);
      _logger.warning("GetSpaces executed with errors");
    }
    return controller.stream;
  }

}

class GetSpacesUsecaseParams {
}

class GetSpacesUsecaseResponse {
  List<Chat> spaces;
  GetSpacesUsecaseResponse(this.spaces);
}