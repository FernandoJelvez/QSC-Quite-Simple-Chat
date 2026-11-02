import 'package:quite_simple_chat/domain/entities/group_chat.dart';

abstract class GroupRepository {
  Future<List<GroupChat>> getGroupChatList();
}