import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:mocktail/mocktail.dart';

class PhotoRepositoryMock extends Mock implements PhotoRepository {}

void main() {
  final repository = PhotoRepositoryMock();
  final usecase = FetchPhotosUsecaseImpl(repository);

  test('Return photos list', () async {
    const int apiPage = 1;
    const int perPage = 1;
    // when
    when(() => repository.fetchPhotos(apiPage, perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(apiPage, perPage);

    // expected
    // expect(result, isA<List<PhotoEntity>>());
    expect(result.isRight, true);

    verify(() => repository.fetchPhotos(apiPage, perPage)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
