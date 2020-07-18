import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/type/badge.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:flutter_pokedex/utils/classes/extensions.dart';

class MoveWidget extends StatelessWidget {
  final Move move;

  MoveWidget({Key key, this.move}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(move.name.capitalize().eliminateDashes()),
        Text(move.power.toString()),
        Text(move.pp.toString()),
        TypeBadgeWidget(
          type: move.type.name,
        )
      ],
    );
  }
}
