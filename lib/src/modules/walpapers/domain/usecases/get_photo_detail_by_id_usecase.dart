import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

abstract class GetPhotoDetailByIdUsecase {
  Future<Either<PhotoRepositoryException, PhotoEntity>> call(int photoId);
}

class GetPhotoDetailByIdUsecaseImpl implements GetPhotoDetailByIdUsecase {
  final PhotoRepository _repository;

  GetPhotoDetailByIdUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoRepositoryException, PhotoEntity>> call(
      int photoId) async {
    return await _repository.getPhotoDetailById(photoId);
  }
}
