import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStatePokemon extends AppStateUtils {
  Map<int, Pokemon> _pokemons = {};

  Map<int, Pokemon> get pokemons => _pokemons;

  Pokemon get(String url) => getSingle<Pokemon>(Pokemon.get, url, _pokemons);
}
