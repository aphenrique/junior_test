import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/data/dto/photo_entity_dto.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';

class ApiPhotoDatasource implements PhotoDatasource {
  final HttpService service;

  ApiPhotoDatasource(this.service);

  @override
  Future<List<PhotoEntity>> fetchPhotos(int apiPage, int perPage) async {
    final result = await service.get("curated?page=$apiPage&per_page=$perPage");

    var list = result['photos'] as List;

    List<PhotoEntity> photos =
        list.map((e) => PhotoEntityDto.fromMap(e)).toList();

    return photos;
  }

  @override
  Future<List<PhotoEntity>> searchPhotos(String query, int perPage) async {
    try {
      final result = await service.get("search?query=$query&per_page=$perPage");

      var list = result['photos'] as List;

      List<PhotoEntity> photos =
          list.map((e) => PhotoEntityDto.fromMap(e)).toList();

      return photos;
    } catch (e) {
      throw PhotoDatasourceException(e.toString());
    }
  }
}
