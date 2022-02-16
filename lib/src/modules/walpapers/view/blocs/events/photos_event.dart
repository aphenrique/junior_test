abstract class PhotosEvent {}

class FetchPhotosEvent implements PhotosEvent {
  final int apiPage;
  final int perPage;

  FetchPhotosEvent({required this.apiPage, required this.perPage});
}
