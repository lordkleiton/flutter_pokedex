import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/moves/moves_box.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_description_box.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_sprite_gallery.dart';
import 'package:flutter_pokedex/utils/pokemon.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class PokemonView extends StatefulWidget {
  final Pokemon pokemon;

  PokemonView({Key key, @required this.pokemon}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<PokemonView> {
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(PokemonUtils.name(pokemon)),
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
