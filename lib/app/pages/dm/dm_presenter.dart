import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/domain/repositories/dm_repository.dart';
import 'package:quite_simple_chat/domain/usecases/get_dm_chats_usecase.dart';

class DmPresenter extends Presenter{

  Function? getDmChatsOnComplete;
  Function? getDmChatsOnError;
  Function? getDmChatsOnNext;
  
  GetDmChatsUsecase _getDmChatsUsecase;
  DmPresenter(DmRepository dmRepository) : _getDmChatsUsecase = GetDmChatsUsecase(dmRepository);

  @override
  void dispose() {
    _getDmChatsUsecase.dispose();
  }

  void getDmChats(String id) {
    print("getDmChats");
    _getDmChatsUsecase.execute(
      _GetDmChatsUsecaseObserver(this), GetDmChatsUsecaseParams(id)
    );
  }

}

class _GetDmChatsUsecaseObserver implements Observer<GetDmChatsUsecaseResponse>{
  final DmPresenter dmPresenter;
  _GetDmChatsUsecaseObserver(this.dmPresenter);

  @override
  void onComplete() {
    assert(dmPresenter.getDmChatsOnComplete!=null);
    dmPresenter.getDmChatsOnComplete!();
  }

  @override
  void onError(Object e) {
    assert(dmPresenter.getDmChatsOnError!=null);
    dmPresenter.getDmChatsOnError!(e);
  }

  @override
  void onNext(response) {
    assert(dmPresenter.getDmChatsOnNext!=null);
    dmPresenter.getDmChatsOnNext!(response!.dmChats);
  }


}