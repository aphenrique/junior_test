import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';

abstract class PhotoRepository {
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> fetchPhotos(
      int apiPage, int perPage);
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> searchPhotos(
      String query, int apiPage, int perPage);
}
