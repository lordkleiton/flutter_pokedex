import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';

class SpriteWidget extends StatelessWidget {
  final String url;
  final bool popup;

  SpriteWidget({Key key, @required this.url, this.popup = true})
      : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      child: CachedNetworkImage(
        placeholder: (context, url) => LoadingIndicatorWidget(),
        fit: BoxFit.contain,
        imageUrl: url,
      ),
      onTap: popup
          ? () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: SpriteWidget(url: url, popup: false),
                ),
              );
            }
          : null,
    );
  }
}
