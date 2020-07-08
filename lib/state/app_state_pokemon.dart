import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

mixin AppStatePokemon {
  Map<int, Pokemon> _pokemons = {};

  Map<int, Pokemon> get pokemons => _pokemons;

  Future<Pokemon> getPokemon(String url) async {
    final int id = QueryUtils.toId(url);

    Pokemon result = _pokemons[id];

    if (result == null) {
      result = await compute(Pokemon.get, id.toString());
      _pokemons[id] = result;
    }

    return result;
  }
}
