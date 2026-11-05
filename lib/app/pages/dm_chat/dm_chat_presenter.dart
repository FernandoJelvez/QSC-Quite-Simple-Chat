import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/repositories/message_repository.dart';
import '../../../domain/usecases/get_dm_chats_messages_usecase.dart';

class DmChatPresenter extends Presenter {
  Function? getDmChatMessageOnComplete;
  Function? getDmChatMessageOnError;
  Function? getDmChatMessageOnNext;

  GetDmChatMessagesUsecase _getDmChatMessagesUseCase;
  DmChatPresenter(MessageRepository messageRepository) : _getDmChatMessagesUseCase = GetDmChatMessagesUsecase(messageRepository);

  @override
  void dispose() {
    _getDmChatMessagesUseCase.dispose();
  }

  void getDmChatMessages(String chatId) {
    _getDmChatMessagesUseCase.execute(
      _GetDmChatMessagesObserver(this), GetDmChatMessagesParams(chatId)
    );
  }

}

class _GetDmChatMessagesObserver extends Observer<GetDmChatMessagesResponse> {
  final DmChatPresenter dmChatPresenter;

  _GetDmChatMessagesObserver(this.dmChatPresenter);


  @override
  void onComplete() {
    assert(dmChatPresenter.getDmChatMessageOnComplete != null);
    dmChatPresenter.getDmChatMessageOnComplete!();
  }

  @override
  void onError(Object error) {
    assert(dmChatPresenter.getDmChatMessageOnError != null);
    dmChatPresenter.getDmChatMessageOnError!(error);

  }

  @override
  void onNext(response) {
   assert(dmChatPresenter.getDmChatMessageOnNext != null);
   dmChatPresenter.getDmChatMessageOnNext!(response!.messages);
  }
}