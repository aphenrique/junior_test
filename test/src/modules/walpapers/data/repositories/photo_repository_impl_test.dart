import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/data/repositories/photo_repository_impl.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:mocktail/mocktail.dart';

class PhotoDatasourceMock extends Mock implements PhotoDatasource {}

void main() {
  final datasource = PhotoDatasourceMock();
  final repository = PhotoRepositoryImpl(datasource);

  test('Should return right to fetch photo list', () async {
    const int apiPage = 1;
    const int perPage = 1;

    // when
    when(() => datasource.fetchPhotos(apiPage: apiPage, perPage: perPage))
        .thenAnswer((_) async => <PhotoEntity>[]);

    // do
    final result =
        await repository.fetchPhotos(apiPage: apiPage, perPage: perPage);

    // final expectedValue = result.fold((l) => l, (r) => r);

    // expect
    expect(result.isRight, true);

    verify(() => datasource.fetchPhotos(apiPage: apiPage, perPage: perPage))
        .called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('Should return right to fetch photo list by search', () async {
    const int apiPage = 1;
    const int perPage = 1;
    const String query = 'any';

    // when
    when(() => datasource.searchPhotos(
          query: query,
          apiPage: apiPage,
          perPage: perPage,
        )).thenAnswer((_) async => <PhotoEntity>[]);

    // do
    final result = await repository.fetchPhotos(
        query: query, apiPage: apiPage, perPage: perPage);

    final expectedValue = result.fold((l) => l, (r) => r);

    // expect
    expect(expectedValue, isA<List<PhotoEntity>>());

    verify(() => datasource.searchPhotos(
        query: query, apiPage: apiPage, perPage: perPage)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
