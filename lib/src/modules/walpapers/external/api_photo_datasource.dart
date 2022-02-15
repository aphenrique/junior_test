import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/data/dto/photo_entity_dto.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';

class ApiPhotoDatasource implements PhotoDatasource {
  final HttpService service;

  ApiPhotoDatasource(this.service);

  @override
  Future<List<PhotoEntity>> fetchPhotos(int page) async {
    final result =
        await service.get('curated?page=${page.toString}&per_page=20');

    var list = result['photos'] as List;

    List<PhotoEntity> photos =
        list.map((e) => PhotoEntityDto.fromMap(e)).toList();

    return photos;
  }

  @override
  Future<PhotoEntity> getPhotoById(int photoId) async {
    try {
      final result = await service.get('photos/$photoId');

      final PhotoEntity photo = PhotoEntityDto.fromMap(result);

      return photo;
    } catch (e) {
      throw PhotoDatasourceException(e.toString());
    }
  }
}
