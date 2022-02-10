import 'package:flutter/material.dart';

class CollageStyle {
  final EdgeInsets margin;

  // by default will get width size
  final double size;

  final String showMore;

  final Color showMoreBackgroundColor;

  final double showMoreBackgroundOpacity;

  final TextStyle showMoreTextStyle;

  final String noImageText;

  final TextStyle noImageTextStyle;

  final Color noImageBackgroundColor;

  const CollageStyle({
    this.size = 0,
    this.noImageText = "Unable to load",
    this.showMoreBackgroundColor = Colors.black,
    this.showMoreBackgroundOpacity = 0.5,
    this.noImageTextStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
    this.showMore = "",
    this.showMoreTextStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 36),
    this.noImageBackgroundColor = Colors.black,
    this.margin = const EdgeInsets.all(0),
  }) : assert(showMoreBackgroundOpacity <= 1);
}
