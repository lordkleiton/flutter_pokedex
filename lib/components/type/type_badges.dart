import 'package:flutter/material.dart';
import 'package:flutter_pokedex/settings.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'badge.dart';

class TypeBadgesWidget extends StatelessWidget {
  final List<PokemonType> types;

  TypeBadgesWidget({Key key, this.types}) : super(key: key);

  Widget build(BuildContext context) {
    List<Widget> _types = [];

    if (types.isNotEmpty) {
      _types.add(TypeBadgeWidget(
        type: types.first.type,
      ));
    }

    if (types.length > 1) {
      _types.addAll([
        SizedBox(
          width: Settings.typeSpacing,
        ),
        TypeBadgeWidget(
          type: types.last.type,
        )
      ]);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _types,
    );
  }
}
