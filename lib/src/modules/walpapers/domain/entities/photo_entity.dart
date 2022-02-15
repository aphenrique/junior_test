class PhotoEntity {
  final int id;
  final int height;
  final int width;
  final String originalPath;
  final String tinyPath;

  PhotoEntity({
    required this.id,
    required this.height,
    required this.width,
    required this.originalPath,
    required this.tinyPath,
  });
}
