import '../entities/dm_chat.dart';

abstract class DmRepository {
  Future<List<DmChat>> getDmChatList();
}