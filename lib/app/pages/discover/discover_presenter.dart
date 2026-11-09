import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/domain/repositories/chat_repository.dart';

import '../../../domain/usecases/get_spaces_usecase.dart';

class DiscoverPresenter extends Presenter{
  Function? getSpacesOnComplete;
  Function? getSpacesOnError;
  Function? getSpacesOnNext;

  final GetSpacesUsecase _getSpacesUsecase;
  DiscoverPresenter(ChatRepository chatRepository) : _getSpacesUsecase = GetSpacesUsecase(chatRepository);
  @override
  void dispose() {
    _getSpacesUsecase.dispose();
  }

  void getSpaces(){
    _getSpacesUsecase.execute(_GetSpacesObserver(this),GetSpacesUsecaseParams());
  }
}

class _GetSpacesObserver extends Observer<GetSpacesUsecaseResponse>{
  DiscoverPresenter discoverPresenter;
  _GetSpacesObserver(this.discoverPresenter);
  @override
  void onComplete() {
    assert(discoverPresenter.getSpacesOnComplete!=null);
    discoverPresenter.getSpacesOnComplete!();
  }

  @override
  void onError(Object error) {
    assert(discoverPresenter.getSpacesOnError!=null);
    discoverPresenter.getSpacesOnError!(error);
  }

  @override
  void onNext(GetSpacesUsecaseResponse? response) {
    assert(discoverPresenter.getSpacesOnNext!=null);
    discoverPresenter.getSpacesOnNext!(response!.spaces);
  }

}