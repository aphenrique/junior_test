import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';

abstract class PhotoDatasource {
  Future<List<PhotoEntity>> fetchPhotos(int apiPage, int perPage);
  Future<List<PhotoEntity>> searchPhotos(String query, int perPage);
}
