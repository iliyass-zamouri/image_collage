import 'package:flutter/material.dart';
import 'package:image_collage/src/extentions/expand_equally.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/widgets/show_image.dart';

class ImageCollage extends StatefulWidget {
  // Image Collage: Stateful Widget
  const ImageCollage({
    Key? key,
    required this.images,
    this.onClick,
    this.widthSize = 0,
    this.noImageText = "Unable to load",
    this.showMoreBackgroundColor = Colors.black,
    this.showMoreBackgroundOpacity = 0.5,
    this.noImageTextStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
    this.showMore = "",
    this.showMoreTextStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 36),
    this.noImageBackgroundColor = Colors.white,
    this.margin = const EdgeInsets.all(0),
  })  : assert(showMoreBackgroundOpacity <= 1),
        super(key: key);

  // list of the images
  final List<Img> images;

  // onClick on the image it gives the clicked image & the list of the images
  final Function(Img, List<Img>)? onClick;

  // margins that apply for the container that holds the images
  final EdgeInsets margin;

  // by default will get width size
  final double widthSize;

  // show more string that will be shown when there is more than 3 images
  // default: +(how much)
  final String showMore;

  // background color of the last image which will be as a filter
  final Color showMoreBackgroundColor;

  // background opacity of the last iamge
  final double showMoreBackgroundOpacity;

  // show more textStyle
  final TextStyle showMoreTextStyle;

  // if no image found in the list, it will show this text
  final String noImageText;

  // no images textStyle
  final TextStyle noImageTextStyle;

  // no image background color
  final Color noImageBackgroundColor;

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
    if (widget.widthSize == 0) {
      size = MediaQuery.of(context).size.width -
          widget.margin.left -
          widget.margin.right;
    } else {
      size = widget.widthSize;
    }
    return SizedBox(
      height: size,
      width: size,
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(context) {
    switch (widget.images.length) {
      case 0:
        return Container(
          color: widget.noImageBackgroundColor,
          width: widget.widthSize == 0
              ? MediaQuery.of(context).size.width -
                  widget.margin.left -
                  widget.margin.right
              : widget.widthSize,
          child: Center(
            child: Text(
              widget.noImageText,
              style: widget.noImageTextStyle,
            ),
          ),
        );
      case 1:
        return ShowImage(
          image: widget.images.first,
          callBack: (image) => widget.onClick!(image, widget.images),
          layout: ImageLayout.full,
          margin: widget.margin,
          noImageBackgroundColor: widget.noImageBackgroundColor,
          noImageText: '',
          width: widget.widthSize,
        );
      case 2:
        return Row(
          children: [
            ShowImage(
              image: widget.images[0],
              callBack: (image) => widget.onClick!(image, widget.images),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: '',
              width: widget.widthSize,
            ),
            ShowImage(
              image: widget.images[1],
              callBack: (image) => widget.onClick!(image, widget.images),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: '',
              width: widget.widthSize,
            )
          ].expandEqually().toList(),
        );

      case 3:
        return Row(
          children: [
            ShowImage(
              image: widget.images[0],
              callBack: (image) => widget.onClick!(image, widget.images),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: '',
              width: widget.widthSize,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images[1],
                  callBack: (image) => widget.onClick!(image, widget.images),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: '',
                  width: widget.widthSize,
                ),
                ShowImage(
                  image: widget.images[2],
                  callBack: (image) => widget.onClick!(image, widget.images),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: '',
                  width: widget.widthSize,
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
              callBack: (image) => widget.onClick!(image, widget.images),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: '',
              width: widget.widthSize,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images[1],
                  callBack: (image) => widget.onClick!(image, widget.images),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: '',
                  width: widget.widthSize,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ShowImage(
                      image: widget.images[2],
                      callBack: (image) =>
                          widget.onClick!(image, widget.images),
                      layout: ImageLayout.quarter,
                      margin: widget.margin,
                      noImageBackgroundColor: widget.noImageBackgroundColor,
                      noImageText: '',
                      width: widget.widthSize,
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () =>
                            widget.onClick!(widget.images[3], widget.images),
                        child: Container(
                          decoration: BoxDecoration(
                              color: widget.showMoreBackgroundColor.withOpacity(
                                  widget.showMoreBackgroundOpacity)),
                          child: Center(
                            child: Text(
                              widget.showMore != ""
                                  ? widget.showMore
                                  : '+${widget.images.length - 3}',
                              style: widget.showMoreTextStyle,
                            ),
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
