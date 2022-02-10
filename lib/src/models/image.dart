import 'package:flutter/cupertino.dart';
import 'package:image_collage/src/models/image_source.dart';

class Img {
  final String image;
  final ImageSource source;
  const Img({
    required this.image,
    this.source = ImageSource.network,
  });
}
