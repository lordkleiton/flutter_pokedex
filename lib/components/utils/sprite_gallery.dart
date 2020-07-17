import 'package:flutter/material.dart';

class SpriteGalleryWidget extends StatelessWidget {
  final List<Widget> spriteWidgets;

  SpriteGalleryWidget({Key key, @required this.spriteWidgets})
      : super(key: key);

  Widget build(BuildContext context) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 100,
          child: spriteWidgets.elementAt(index),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: spriteWidgets.length,
        shrinkWrap: true,
      );
}
