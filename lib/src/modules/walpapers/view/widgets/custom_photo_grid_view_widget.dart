import 'package:flutter/material.dart';

import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_small_photo_widget.dart';

class CustomPhotoGridViewWidget extends StatelessWidget {
  final List<PhotoEntity> photos;

  const CustomPhotoGridViewWidget({Key? key, required this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.7,
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];

        return CustomSmallPhotoWidget(photoPath: photo.tinyPath);
      },
    );
  }
}