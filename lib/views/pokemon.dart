import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon/pokemon_sprite_gallery.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:flutter_pokedex/utils/extensions.dart';
import 'package:flutter_pokedex/utils/state.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class PokemonView extends StatefulWidget {
  final Pokemon pokemon;

  PokemonView({Key key, @required this.pokemon}) : super(key: key);

  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  Future<PokemonSpecies> _species;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final AppState appState = StateUtils.appState(context);

    _species = appState.getSpecies(widget.pokemon.species.url);
  }

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
            FutureBuilder(
              future: _species,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text('carregou species ainda n');

                final PokemonSpecies data = snapshot.data;
                final List<Widget> children =
                    data.flavorTextEntries.map((element) {
                  return Text(element.flavorText.replaceAll('\n', ' ') +
                      ' - Pokémon ' +
                      element.version.name.capitalize().eliminateDashes());
                }).toList();

                return Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (context, index) => children.elementAt(index),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
