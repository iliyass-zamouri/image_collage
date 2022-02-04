import 'package:flutter/material.dart';
import 'package:image_collage/src/models/collage_style.dart';
import 'package:image_collage/src/extentions/expand_equally.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/widgets/show_image.dart';

class ImageCollage extends StatefulWidget {
  final List<Img> images;

  final CollageStyle style;
  const ImageCollage(
      {Key? key, required this.images, this.style = const CollageStyle()})
      : super(key: key);

  @override
  State<ImageCollage> createState() => ImageCollageState();
}

late double size;

class ImageCollageState extends State<ImageCollage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.style.size == 0) {
      size = MediaQuery.of(context).size.width -
          widget.style.margin.left -
          widget.style.margin.right;
    } else {
      size = widget.style.size;
    }
    return SizedBox(
      height: size,
      width: size,
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(context) {
    switch (widget.images.length) {
      case 1:
        return ShowImage(
          image: widget.images.first,
          style: widget.style,
          layout: ImageLayout.full,
        );
      case 2:
        return Row(
          children: [
            ShowImage(
              image: widget.images[0],
              style: widget.style,
              layout: ImageLayout.half,
            ),
            ShowImage(
              image: widget.images[1],
              style: widget.style,
              layout: ImageLayout.half,
            )
          ].expandEqually().toList(),
        );

      case 3:
        return Row(
          children: [
            ShowImage(
              image: widget.images[0],
              style: widget.style,
              layout: ImageLayout.half,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images[1],
                  style: widget.style,
                  layout: ImageLayout.quarter,
                ),
                ShowImage(
                  image: widget.images[2],
                  style: widget.style,
                  layout: ImageLayout.quarter,
                ),
              ].expandEqually().toList(),
            )
          ].expandEqually().toList(),
        );
      default:
        return Row(
          children: [
            ShowImage(
              image: widget.images[0],
              style: widget.style,
              layout: ImageLayout.half,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images[1],
                  style: widget.style,
                  layout: ImageLayout.quarter,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ShowImage(
                      image: widget.images[2],
                      style: widget.style,
                      layout: ImageLayout.quarter,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.style.showMoreBackgroundColor
                                .withOpacity(
                                    widget.style.showMoreBackgroundOpacity)),
                        child: Center(
                          child: Text(
                            widget.style.showMore != ""
                                ? widget.style.showMore
                                : '+${widget.images.length - 3}',
                            style: widget.style.showMoreTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ].expandEqually().toList(),
            )
          ].expandEqually().toList(),
        );
    }
  }
}
