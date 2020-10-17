import 'package:flutter/material.dart';
import 'package:flutter_pokedex/state/app_state_species.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pokedex/utils/classes/extensions.dart';

class PokemonDescriptionBoxWidget extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDescriptionBoxWidget({Key key, @required this.pokemon})
      : super(key: key);

  Widget build(BuildContext context) {
    final AppStateSpecies state = Provider.of(context);
    final PokemonSpecies species = state.get(pokemon.species.url);
    final List<Widget> children = species?.flavorTextEntries
            ?.where((e) => e?.language?.name == 'en')
            ?.map((e) => Text(
                '${e?.flavorText?.replaceAll('\n', ' ')} - Pokémon ${e?.version?.name?.capitalize()?.eliminateDashes()}'))
            ?.toList() ??
        [];

    return Column(
      children: <Widget>[
        Text('Descriptions'),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) => children.elementAt(index),
          ),
        )
      ],
    );
  }
}
