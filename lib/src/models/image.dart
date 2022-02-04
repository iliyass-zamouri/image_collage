import 'package:flutter/cupertino.dart';
import 'package:image_collage/src/models/image_source.dart';

class Img {
  final String image;
  final VoidCallback? onTap;
  final ImageSource source;
  const Img({
    required this.image,
    this.onTap,
    this.source = ImageSource.network,
  });
}
