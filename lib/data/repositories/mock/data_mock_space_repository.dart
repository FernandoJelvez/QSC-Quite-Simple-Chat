import 'package:quite_simple_chat/domain/entities/space.dart';
import 'package:quite_simple_chat/domain/repositories/space_repository.dart';

class DataMockSpaceRepository extends SpaceRepository {
  List<Space> subscribedSpaces = [
    Space("Lsg13afs12","#games", "new game out!", {"pedro","juan","diego","tom","richard","harry"},
        "juan", DateTime.now().subtract(Duration(minutes:2)), "A place to talk about games and related stuff"),
    Space("AEFo23F245","#animation", "anyone here uses blender?", {"pedro","juan","john","louis","jane"},
        "diego", DateTime.now().subtract(Duration(days: 1)), "A place by animators for animators, go to #animations if you want to talk about shows or films"),
  ];
  List<Space> spaces = [
    Space("Lsg13afs12","#games", "new game out!", {"pedro","juan","diego","tom","richard","harry"},
        "juan", DateTime.now().subtract(Duration(minutes:2)), "A place to talk about games and related stuff"),
    Space("AEFo23F245","#animation", "anyone here uses blender?", {"pedro","juan","john","louis","jane"},
        "diego", DateTime.now().subtract(Duration(days: 1)), "A place by animators for animators, go to #animations if you want to talk about shows or films"),
    Space("AEFo23F245","#animations", "does anyone knows a good short film", {"pedro","juan","john","louis"},
        "diego", DateTime.now().subtract(Duration(days: 1)), "A place to talk about animated media, if you want to talk about animating go to #animation"),
    Space("AEG32qGEs1","#computers", "check this article about nvidia", {"qwerty","john123","potato","aff13","luke"},
        "john123", DateTime.now().subtract(Duration(days: 4)), "Anything computer related, from retro PCs to the latest hardware"),
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