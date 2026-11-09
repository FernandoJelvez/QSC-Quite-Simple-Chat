import 'package:quite_simple_chat/domain/entities/space.dart';
import 'package:quite_simple_chat/domain/repositories/space_repository.dart';

class DataMockSpaceRepository extends SpaceRepository {
  List<Space> subscribedSpaces = [
    Space("Lsg13afs12","#games", "new game out!", {"pedro","juan","diego","tom","richard","harry"},
        "juan", DateTime.now().subtract(Duration(minutes:2))),
    Space("AEFo23F245","#animation", "anyone here uses blender?", {"pedro","juan","john","louis","jane"},
        "diego", DateTime.now().subtract(Duration(days: 1))),
  ];
  List<Space> spaces = [
    Space("Lsg13afs12","#games", "new game out!", {"pedro","juan","diego","tom","richard","harry"},
        "juan", DateTime.now().subtract(Duration(minutes:2))),
    Space("AEFo23F245","#animation", "anyone here uses blender?", {"pedro","juan","john","louis","jane"},
        "diego", DateTime.now().subtract(Duration(days: 1))),
    Space("AEG32qGEs1","#computers", "check this article about nvidia", {"qwerty","john123","potato","aff13","luke"},
        "john123", DateTime.now().subtract(Duration(days: 4))),
  ];
  
  @override
  Future<List<Space>> getSpacesList() async {
    return spaces;
  }

  @override
  Future<List<Space>> getSubscribedSpacesList() async {
    return subscribedSpaces;
  }
  
}