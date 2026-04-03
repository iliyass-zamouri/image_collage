import 'package:flutter/material.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/models/image_source.dart';

class ShowImage extends StatelessWidget {
  // Widget that render each image
  const ShowImage(
      {Key? key,
      required this.image,
      required this.margin,
      required this.width,
      required this.noImageText,
      required this.noImageBackgroundColor,
      required this.callBack,
      required this.layout,
      this.isLast = false})
      : super(key: key);
  // image object
  final Img image;
  // layout:  full, half, quarter
  final ImageLayout layout;
  // margin (for backwards compatibility, not used for child layout now)
  final EdgeInsets margin;
  // no Image Background Color
  final Color noImageBackgroundColor;
  // no Image Text
  final String noImageText;
  // width & height are linked to each other width = height = valueBelow
  final double width;
  // call back with the image
  final Function(Img) callBack;
  // is last to show the showmore
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    switch (image.source) {
      case ImageSource.assets:
        imageWidget = Image.asset(
          image.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
        break;
      case ImageSource.network:
        imageWidget = Image.network(
          image.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
        break;
      default:
        imageWidget = Container(
          color: noImageBackgroundColor,
          alignment: Alignment.center,
          child: Text(noImageText),
        );
        break;
    }

    return GestureDetector(
      onTap: () => callBack(image),
      child: SizedBox.expand(
        child: imageWidget,
      ),
    );
      case ImageSource.assets:
        return GestureDetector(
          onTap: () => callBack(image),
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
          onTap: () => callBack(image),
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
          onTap: () => callBack(image),
          child: Container(
            color: noImageBackgroundColor,
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
            child: Text(noImageText),
          ),
        );
    }
  }
}
