import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/domain/repositories/group_repository.dart';
import 'package:quite_simple_chat/domain/usecases/get_group_chats_usecase.dart';

class GroupsPresenter extends Presenter{

  Function? getGroupChatsOnComplete;
  Function? getGroupChatsOnError;
  Function? getGroupChatsOnNext;
  
  GetGroupChatsUsecase _getGroupChatsUsecase;
  GroupsPresenter(GroupRepository groupRepository) : _getGroupChatsUsecase = GetGroupChatsUsecase(groupRepository);

  @override
  void dispose() {
    _getGroupChatsUsecase.dispose();
  }

  void getGroupChats(String id) {
    print("getGroupChats");
    _getGroupChatsUsecase.execute(
      _GetGroupChatsUsecaseObserver(this), GetGroupChatsUsecaseParams()
    );
  }

}

class _GetGroupChatsUsecaseObserver implements Observer<GetGroupChatsUsecaseResponse>{
  final GroupsPresenter groupPresenter;
  _GetGroupChatsUsecaseObserver(this.groupPresenter);

  @override
  void onComplete() {
    assert(groupPresenter.getGroupChatsOnComplete!=null);
    groupPresenter.getGroupChatsOnComplete!();
  }

  @override
  void onError(Object e) {
    assert(groupPresenter.getGroupChatsOnError!=null);
    groupPresenter.getGroupChatsOnError!(e);
  }

  @override
  void onNext(response) {
    assert(groupPresenter.getGroupChatsOnNext!=null);
    groupPresenter.getGroupChatsOnNext!(response!.groupChats);
  }


}