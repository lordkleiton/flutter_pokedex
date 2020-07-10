import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/components/utils/sprite.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:flutter_pokedex/utils/state.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class SelectPokemonComponent extends StatefulWidget {
  final NamedApiResource data;

  SelectPokemonComponent({Key key, @required this.data}) : super(key: key);

  @override
  _SelectPokemonState createState() => _SelectPokemonState();
}

class _SelectPokemonState extends State<SelectPokemonComponent> {
  Future<Pokemon> _pokemon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final AppState appState = StateUtils.appState(context);

    _pokemon = appState.getPokemon(widget.data.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
      future: _pokemon,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: LoadingSpinningCircle(),
          );
        }

        final Pokemon pokemon = snapshot.data;

        return InkWell(
          child: Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SpriteWidget(
              url: pokemon.sprites.frontDefault,
            ),
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed('/pokemon', arguments: {'pokemon': pokemon});
          },
        );
      },
    );
  }
}
