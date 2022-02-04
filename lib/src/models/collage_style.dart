import 'package:flutter/material.dart';

class CollageStyle {
  final EdgeInsets margin;

  // by default will get width size
  final double size;

  final String noImageText;

  final Color noImageBackgroundColor;

  const CollageStyle({
    this.size = 0,
    this.noImageText = "No Image",
    this.noImageBackgroundColor = Colors.black,
    this.margin = const EdgeInsets.all(0),
  });
}
