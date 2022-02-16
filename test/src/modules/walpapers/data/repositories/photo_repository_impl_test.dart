import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/data/repositories/photo_repository_impl.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:mocktail/mocktail.dart';

class PhotoDatasourceMock extends Mock implements PhotoDatasource {}

void main() {
  final datasource = PhotoDatasourceMock();
  final repository = PhotoRepositoryImpl(datasource);

  test('photo repository impl ...', () async {
    // when
    const int apiPage = 1;
    const int perPage = 1;
    when(() => datasource.fetchPhotos(apiPage, perPage))
        .thenAnswer((_) async => <PhotoEntity>[]);

    // do
    final result = await repository.fetchPhotos(apiPage, perPage);

    // expect
    // expect(result, isA<List<PhotoEntity>>());
    expect(result.isRight, true);

    verify(() => datasource.fetchPhotos(apiPage, perPage)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
