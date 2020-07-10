import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_sprite_gallery.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class PokemonView extends StatefulWidget {
  final Pokemon pokemon;

  PokemonView({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
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
          ],
        ),
      ),
    );
  }
}
