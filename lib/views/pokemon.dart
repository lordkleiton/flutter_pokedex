import 'package:flutter/material.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:flutter_pokedex/utils/state.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class PokemonView extends StatefulWidget {
  final int id;

  PokemonView({Key key, this.id}) : super(key: key);

  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  Future<Pokemon> pokemon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = StateUtils.appState(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}
