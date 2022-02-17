import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';

class PhotoEntityDto extends PhotoEntity {
  PhotoEntityDto({
    required String originalPath,
  }) : super(
          originalPath: originalPath,
        );

  Map<String, dynamic> toMap() {
    return {
      'originalPath': originalPath,
    };
  }

  factory PhotoEntityDto.fromMap(Map<String, dynamic> map) {
    return PhotoEntityDto(
      originalPath: map['src']['large'] ?? '',
    );
  }
}
