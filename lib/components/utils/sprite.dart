import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';

class SpriteWidget extends StatelessWidget {
  final String url;

  SpriteWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => LoadingIndicatorWidget(),
      fit: BoxFit.contain,
      imageUrl: url,
    );
  }
}
