import 'package:quite_simple_chat/domain/entities/dm_chat.dart';
import 'package:quite_simple_chat/domain/repositories/dm_repository.dart';

class DataMockDmChatRepository extends DmRepository {
  @override
  Future<List<DmChat>> getDmChatList() async {
    List<DmChat> list = List.empty(growable: true);
    list.add(DmChat(name: "pyotr", lastMessage: "overture 1812", lastTime: DateTime.now().subtract(Duration(days: 1))));
    list.add(DmChat(name: "sebastian", lastMessage: "cello suite no. 1", lastTime: DateTime.now().subtract(Duration(days: 5))));
    list.add(DmChat(name: "ludwig", lastMessage: "9th symphony", lastTime: DateTime.now().subtract(Duration(hours: 1))));
    list.add(DmChat(name: "claude", lastMessage: "clair de lune", lastTime: DateTime.now().subtract(Duration(days: 10))));
    print("length ${list.length}");
    return list;
  }
}