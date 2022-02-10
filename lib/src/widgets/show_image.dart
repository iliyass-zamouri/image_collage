import 'package:flutter/material.dart';
import 'package:image_collage/src/models/collage_style.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/models/image_source.dart';

class ShowImage extends StatelessWidget {
  final Img image;
  final ImageLayout layout;
  final CollageStyle style;
  final Function(Img) callBack;
  final bool isLast;
  const ShowImage(
      {Key? key,
      required this.image,
      required this.style,
      required this.callBack,
      required this.layout,
      this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double size;
    if (style.size == 0) {
      size = MediaQuery.of(context).size.width -
          style.margin.left -
          style.margin.right;
    } else {
      size = style.size;
    }
    switch (image.source) {
      case ImageSource.assets:
        return GestureDetector(
          onTap: callBack(image),
          child: Image.asset(
            image.image,
            height: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size
                    : size / 2,
            width: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size / 2
                    : size / 2,
            fit: BoxFit.cover,
          ),
        );
      case ImageSource.network:
        return GestureDetector(
          onTap: callBack(image),
          child: Image.network(
            image.image,
            height: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size
                    : size / 2,
            width: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size / 2
                    : size / 2,
            fit: BoxFit.cover,
          ),
        );
      default:
        return GestureDetector(
          onTap: callBack(image),
          child: Container(
            color: style.noImageBackgroundColor,
            height: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size
                    : size / 2,
            width: layout == ImageLayout.full
                ? size
                : layout == ImageLayout.half
                    ? size / 2
                    : size / 2,
            child: Text(style.noImageText),
          ),
        );
    }
  }
}
