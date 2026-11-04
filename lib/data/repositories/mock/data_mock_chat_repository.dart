import 'package:quite_simple_chat/domain/entities/chat_type.dart';

import '../../../domain/entities/chat.dart';
import '../../../domain/repositories/chat_repository.dart';

class DataMockChatRepository extends ChatRepository {
  @override
  Future<List<Chat>> getGroupChatList() async {
    List<Chat> groups = [];
    groups.add(
        Chat("AFNC3093fn","group 1", "hello everyone", {"pedro","juan","diego"},
            "diego", DateTime.now().subtract(Duration(days: 1)),ChatType.group,[])
    );
    groups.add(
        Chat("EIFVNai02n","group trh", "hello everybody", {"tom","richard","harry"},
            "richard", DateTime.now().subtract(Duration(days: 2)),ChatType.group,[])
    );
    groups.add(
        Chat("infAEIFN932","evangelists", "hello!", {"mathew","mark","luke","john"},
            "luke", DateTime.now().subtract(Duration(days: 10)),ChatType.group,[])
    );
    groups.sort((e,f)=>f.lastTime!.compareTo(e.lastTime!));
    return groups;
  }

  @override
  Future<List<Chat>> getDmChatList() async {
    List<Chat> list = List.empty(growable: true);
    list.add(Chat("92eASvnaids","pyotr","overture 1812",{"john, pyotr"}, "john", DateTime.now().subtract(Duration(days: 1)), ChatType.dm, []));
    list.add(Chat("AVAinges0ww","sebastian", "cello suite no. 1",{"john", "sebastian"},"john",DateTime.now().subtract(Duration(days: 5)), ChatType.dm, []));
    list.add(Chat("Afp1mwf238n","ludwig", "9th symphony",{"john", "ludwig"},"john",DateTime.now().subtract(Duration(hours: 1)), ChatType.dm, []));
    list.add(Chat("239AFSinw0q","claude", "clair de lune",{"john", "claude"},"john",DateTime.now().subtract(Duration(days: 10)), ChatType.dm, []));
    list.add(Chat("QWsf20fhAFS","antonio", "spring",{"john","antonio"},"john",DateTime.now().subtract(Duration(days: 4)), ChatType.dm, []));
    list.add(Chat("ASFin2wf923","maurice", "bolero",{"john","maurice"},"john",DateTime.now().subtract(Duration(days: 30)), ChatType.dm, []));
    list.add(Chat("WAFn123hASF","frederic", "nocturne",{"john","frederic"},"john",DateTime.now().subtract(Duration(minutes: 14)), ChatType.dm, []));
    list.add(Chat("Fasf3f0jAFS","george", "rhapsody in blue",{"john","george"},"john",DateTime.now().subtract(Duration(hours: 20)), ChatType.dm, []));
    list.add(Chat("E2903fjajsS","francisco", "gran vals",{"john","francisco"},"john",DateTime.now().subtract(Duration(days: 12)), ChatType.dm, []));
    list.add(Chat("SAFono90nAS","clara", "the swan",{"john","clara"},"john",DateTime.now().subtract(Duration(days: 3)), ChatType.dm, []));

    list.sort((e,f) => f.lastTime!.compareTo(e.lastTime!));
    print("length ${list.length}");
    return list;
  }
}