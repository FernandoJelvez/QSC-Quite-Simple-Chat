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
    list.add(DmChat(name: "antonio", lastMessage: "spring", lastTime: DateTime.now().subtract(Duration(days: 4))));
    list.add(DmChat(name: "maurice", lastMessage: "bolero", lastTime: DateTime.now().subtract(Duration(days: 30))));
    list.add(DmChat(name: "frederic", lastMessage: "nocturne", lastTime: DateTime.now().subtract(Duration(minutes: 14))));
    list.add(DmChat(name: "george", lastMessage: "rhapsody in blue", lastTime: DateTime.now().subtract(Duration(hours: 20))));
    list.add(DmChat(name: "francisco", lastMessage: "gran vals", lastTime: DateTime.now().subtract(Duration(days: 12))));
    list.add(DmChat(name: "clara", lastMessage: "the swan", lastTime: DateTime.now().subtract(Duration(days: 3))));

    list.sort((e,f) => f.lastTime!.compareTo(e.lastTime!));
    print("length ${list.length}");
    return list;
  }
}