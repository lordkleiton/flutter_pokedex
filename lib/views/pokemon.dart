import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/moves/moves_box.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_sprite_gallery.dart';
import 'package:flutter_pokedex/state/app_state_species.dart';
import 'package:flutter_pokedex/utils/extensions.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';

class PokemonView extends StatefulWidget {
  final Pokemon pokemon;

  PokemonView({Key key, @required this.pokemon}) : super(key: key);

  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;
    final String title = pokemon.name.capitalize().eliminateDashes();
    final AppStateSpecies appState = Provider.of(context);
    final PokemonSpecies species = appState.get(pokemon.species.url);
    final List<Widget> children = species != null
        ? species.flavorTextEntries.map((element) {
            return Text(element.flavorText.replaceAll('\n', ' ') +
                ' - Pokémon ' +
                element.version.name.capitalize().eliminateDashes());
          }).toList()
        : [];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: PokemonSpriteGalleryWidget(
                sprites: pokemon.sprites,
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) => children.elementAt(index),
              ),
            ),
            MovesBoxWidget(
              pokemon: pokemon,
            ),
          ],
        ),
      ),
    );
  }
}
