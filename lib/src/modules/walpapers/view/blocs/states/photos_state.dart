import '../../../domain/entities/photo_entity.dart';

abstract class PhotosState {}

class FetchPhotosInitial extends PhotosState {
  final List<PhotoEntity> photos = [];
}

class FetchPhotosSucess extends PhotosState {
  final List<PhotoEntity> photos;

  FetchPhotosSucess(this.photos);
}

class FetchPhotosError extends PhotosState {
  final String message;

  FetchPhotosError(
    this.message,
  );
}

class FetchPhotosLoading extends PhotosState {
  FetchPhotosLoading();
}
