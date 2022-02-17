import 'package:flutter/material.dart';

class CustomSmallPhotoWidget extends StatelessWidget {
  final String photoPath;

  const CustomSmallPhotoWidget({
    Key? key,
    required this.photoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photoPath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
