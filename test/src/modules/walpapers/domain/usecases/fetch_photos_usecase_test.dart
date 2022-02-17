import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:mocktail/mocktail.dart';

class PhotoRepositoryMock extends Mock implements PhotoRepository {}

void main() {
  test('Return right to fetch photo list', () async {
    final repository = PhotoRepositoryMock();
    final usecase = FetchPhotosUsecaseImpl(repository);

    const int apiPage = 1;
    const int perPage = 1;

    // when
    when(() => repository.fetchPhotos(apiPage: apiPage, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(apiPage: apiPage, perPage: perPage);

    // expected
    expect(result.isRight, true);

    verify(() => repository.fetchPhotos(apiPage: apiPage, perPage: perPage))
        .called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Return right to fetch photo list by search', () async {
    final repository = PhotoRepositoryMock();
    final usecase = FetchPhotosUsecaseImpl(repository);

    const int apiPage = 1;
    const int perPage = 1;
    const String query = 'any';
    // when
    when(() => repository.fetchPhotos(
        query: query,
        apiPage: apiPage,
        perPage: perPage)).thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result =
        await usecase(query: query, apiPage: apiPage, perPage: perPage);

    // expected
    expect(result.isRight, true);

    verify(() => repository.fetchPhotos(
        query: query, apiPage: apiPage, perPage: perPage)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Return PhotoParamsException caused by empty search', () async {
    final repository = PhotoRepositoryMock();
    final usecase = FetchPhotosUsecaseImpl(repository);

    const int apiPage = 1;
    const int perPage = 1;
    const String query = '';
    // when

    // do
    final result =
        await usecase(query: query, apiPage: apiPage, perPage: perPage);

    final expectedValue = result.fold((l) => l, (r) => r);

    // expected
    expect(expectedValue, isA<PhotoParamsException>());

    verifyNoMoreInteractions(repository);
  });

  test('Return PhotoParamsException caused by wrong range of apiPage',
      () async {
    final repository = PhotoRepositoryMock();
    final usecase = FetchPhotosUsecaseImpl(repository);

    const int apiPage = 0;
    const int perPage = 1;

    // when
    when(() => repository.fetchPhotos(apiPage: apiPage, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(apiPage: apiPage, perPage: perPage);

    final expectedValue = result.fold((l) => l, (r) => r);

    // expected
    expect(expectedValue, isA<PhotoParamsException>());

    // verify(() => repository.fetchPhotos(apiPage: apiPage, perPage: perPage))
    //     .called(1);
    verifyNoMoreInteractions(repository);
  });
}
