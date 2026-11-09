import '../entities/chat.dart';

abstract class ChatRepository {
  Future<List<Chat>> getGroupChatList();
  Future<List<Chat>> getDmChatList();
  Future<List<Chat>> getSubscribedSpacesList();
  Future<List<Chat>> getSpacesList();
}