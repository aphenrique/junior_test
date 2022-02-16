import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDatasource _datasource;

  PhotoRepositoryImpl(this._datasource);

  @override
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> fetchPhotos(
      int apiPage, int perPage) async {
    try {
      var result = await _datasource.fetchPhotos(apiPage, perPage);

      return right(result);
    } catch (e) {
      return left(
          PhotoRepositoryException('Falha ao buscar os dados no datasource!'));
    }
  }

  @override
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> searchPhotos(
      String query, int perPage) async {
    try {
      var result = await _datasource.searchPhotos(query, perPage);

      return right(result);
    } catch (e) {
      throw PhotoRepositoryException('Falha ao buscar os dados no datasource!');
    }
  }
}
