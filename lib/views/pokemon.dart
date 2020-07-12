import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/moves/moves_box.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_description_box.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_sprite_gallery.dart';
import 'package:flutter_pokedex/utils/extensions.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

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
            PokemonDescriptionBoxWidget(
              pokemon: pokemon,
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
