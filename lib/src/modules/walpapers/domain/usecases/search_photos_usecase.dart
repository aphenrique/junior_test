import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

abstract class SearchPhotosUsecase {
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> call(
      String query, int apiPage, int perPage);
}

class SearchPhotosUsecaseImpl implements SearchPhotosUsecase {
  final PhotoRepository _repository;

  SearchPhotosUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> call(
      String query, int apiPage, int perPage) async {
    return await _repository.searchPhotos(query, apiPage, perPage);
  }
}
