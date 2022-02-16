import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/external/api_photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';
import 'package:fteam_test/src/core/utils/clients/uno_service.dart';

void main() {
  test('api photo datasource ...', () async {
    final HttpService service = UnoService();
    final datasource = ApiPhotoDatasource(service);

    const int apiPage = 1;
    const int perPage = 2;

    final result = await datasource.fetchPhotos(apiPage, perPage);

    expect(result, isA<List<PhotoEntity>>());
    expect(result.length, 2);
  });
}
