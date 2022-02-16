import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

abstract class FetchPhotosUsecase {
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> call(int apiPage, int perPage);
}

class FetchPhotosUsecaseImpl implements FetchPhotosUsecase {
  final PhotoRepository _repository;

  FetchPhotosUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoRepositoryException, List<PhotoEntity>>> call(
      int apiPage, int perPage) async {
    return await _repository.fetchPhotos(apiPage, perPage);
  }
}
