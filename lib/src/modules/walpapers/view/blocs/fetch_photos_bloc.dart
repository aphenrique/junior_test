import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/events/photos_event.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/states/fetch_photos_state.dart';

class FetchPhotosBloc extends Bloc<PhotosEvent, FetchPhotosState> {
  final FetchPhotosUsecase usecase;

  FetchPhotosBloc(this.usecase) : super(FetchPhotosInitial()) {
    on<FetchPhotosEvent>(fetchPhotos);
  }

  fetchPhotos(FetchPhotosEvent event, Emitter<FetchPhotosState> emit) async {
    emit(FetchPhotosLoading());

    final response = await usecase(event.apiPage, event.perPage);

    emit(
      response.fold(
        (failure) => FetchPhotosError('Erro ao buscar fotos'),
        (photos) {

         return FetchPhotosSucess(photos);
        },
      ),
    );
  }
}
