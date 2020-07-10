import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SpriteWidget extends StatelessWidget {
  final String url;

  SpriteWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: url,
    );
  }
}
