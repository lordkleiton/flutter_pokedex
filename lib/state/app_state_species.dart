import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStateSpecies extends AppStateUtils {
  Map<int, PokemonSpecies> _species = {};

  Map<int, PokemonSpecies> get species => _species;

  PokemonSpecies get(String url) {
    final int id = toId(url);
    final PokemonSpecies result = _species[id];

    if (result == null) getSingle(PokemonSpecies.get, url, _species);

    return result;
  }
}
