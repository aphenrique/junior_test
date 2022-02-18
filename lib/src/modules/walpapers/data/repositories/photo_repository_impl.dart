import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDatasource _datasource;

  PhotoRepositoryImpl(this._datasource);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> fetchPhotos(
      {String? query, required int apiPage, required int perPage}) async {
    try {
      List<PhotoEntity> result;

      if (query != null) {
        result = await _datasource.searchPhotos(
            query: query, apiPage: apiPage, perPage: perPage);
      } else {
        result =
            await _datasource.fetchPhotos(apiPage: apiPage, perPage: perPage);
      }
      return right(result);
    } on PhotoDatasourceException catch (e) {
      return left(PhotoDatasourceException(e.toString()));
    }
  }
}
