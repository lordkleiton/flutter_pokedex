import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

mixin AppStatePokemon {
  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  Future<Pokemon> getPokemon(String query) async {
    final int id = QueryUtils.toId(query);

    Pokemon result = _pokemons.firstWhere((p) => p.name == query || p.id == id,
        orElse: () => null);

    if (result == null) {
      result = await compute(Pokemon.get, QueryUtils.toQueryable(query));
      _pokemons.add(result);
    }

    return result;
  }
}
