import '../../../domain/entities/photo_entity.dart';

abstract class FetchPhotosState {}

class FetchPhotosInitial extends FetchPhotosState {
  final List<PhotoEntity> photos = [];
}

class FetchPhotosSucess extends FetchPhotosState {
  final List<PhotoEntity> photos;

  FetchPhotosSucess(this.photos);
}

class FetchPhotosError extends FetchPhotosState {
  final String message;

  FetchPhotosError(
    this.message,
  );
}

class FetchPhotosLoading extends FetchPhotosState {
  FetchPhotosLoading();
}
