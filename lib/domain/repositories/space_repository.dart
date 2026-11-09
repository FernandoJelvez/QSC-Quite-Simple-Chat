import '../entities/space.dart';

abstract class SpaceRepository {
  Future<List<Space>> getSpacesList();
  Future<List<Space>> getSubscribedSpacesList();
}