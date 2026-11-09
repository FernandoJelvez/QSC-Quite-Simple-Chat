import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/domain/usecases/get_subscribed_spaces_usecase.dart';

import '../../../domain/repositories/space_repository.dart';

class SpacesPresenter extends Presenter{
  Function? getSubscribedSpacesOnComplete;
  Function? getSubscribedSpacesOnError;
  Function? getSubscribedSpacesOnNext;
  
  GetSubscribedSpacesUsecase _getSubscribedSpacesUsecase;

  SpacesPresenter(SpaceRepository repository) : _getSubscribedSpacesUsecase = GetSubscribedSpacesUsecase(repository);
  
  
  @override
  void dispose() {
    _getSubscribedSpacesUsecase.dispose();
  }
  
  void getSubscribedSpaces(){
    _getSubscribedSpacesUsecase.execute(GetSubscribedSpacesObserver(this),GetSubscribedSpacesParams());
  }
}
class GetSubscribedSpacesObserver implements Observer<GetSubscribedSpacesResponse> {
  SpacesPresenter spacesPresenter;
  GetSubscribedSpacesObserver(this.spacesPresenter);

  @override
  void onComplete() {
    assert(spacesPresenter.getSubscribedSpacesOnComplete!=null);
    spacesPresenter.getSubscribedSpacesOnComplete!();
  }

  @override
  void onError(Object e) {
    assert(spacesPresenter.getSubscribedSpacesOnError!=null);
    spacesPresenter.getSubscribedSpacesOnError!(e);
  }

  @override
  void onNext(response) {
    assert(spacesPresenter.getSubscribedSpacesOnNext!=null);
    spacesPresenter.getSubscribedSpacesOnNext!(response!.subscribedSpaces);
  }
  
}