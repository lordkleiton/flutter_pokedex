import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

mixin AppStateSpecies {
  Map<int, PokemonSpecies> _species = {};

  Map<int, PokemonSpecies> get species => _species;

  Future<PokemonSpecies> getSpecies(String url) async {
    final int id = QueryUtils.toId(url);

    PokemonSpecies result = _species[id];

    if (result == null) {
      result = await compute(PokemonSpecies.get, id.toString());
      _species[id] = result;
    }

    return result;
  }
}
