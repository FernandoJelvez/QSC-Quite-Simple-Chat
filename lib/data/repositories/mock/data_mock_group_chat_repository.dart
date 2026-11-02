import 'package:quite_simple_chat/domain/entities/group_chat.dart';

import '../../../domain/repositories/group_repository.dart';

class DataMockGroupChatRepository extends GroupRepository {
  @override
  Future<List<GroupChat>> getGroupChatList() async {
    List<GroupChat> groups = [];
    groups.add(
        GroupChat("group 1", "hello everyone", ["pedro","juan","diego"],
            "diego", DateTime.now().subtract(Duration(days: 1)))
    );
    groups.add(
        GroupChat("group trh", "hello everybody", ["tom","richard","harry"],
            "richard", DateTime.now().subtract(Duration(days: 2)))
    );
    groups.add(
        GroupChat("evangelists", "hello!", ["mathew","mark","luke","john"],
            "luke", DateTime.now().subtract(Duration(days: 10)))
    );
    groups.sort((e,f)=>f.lastTime!.compareTo(e.lastTime!));
    return groups;
  }

}