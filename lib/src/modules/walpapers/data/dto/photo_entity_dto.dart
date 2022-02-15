import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';

class PhotoEntityDto extends PhotoEntity {
  PhotoEntityDto({
    required int id,
    required int height,
    required int width,
    required String originalPath,
    required String tinyPath,
  }) : super(
          id: id,
          height: height,
          width: width,
          originalPath: originalPath,
          tinyPath: tinyPath,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'height': height,
      'width': width,
      'originalPath': originalPath,
      'tinyPath': tinyPath,
    };
  }

  factory PhotoEntityDto.fromMap(Map<String, dynamic> map) {
    return PhotoEntityDto(
      id: map['id']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
      width: map['width']?.toInt() ?? 0,
      originalPath: map['src']['original'] ?? '',
      tinyPath: map['src']['tiny'] ?? '',
    );
  }
}
