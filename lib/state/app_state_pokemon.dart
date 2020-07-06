import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStatePokemon {
  List<Pokemon> pokemons = [];

  List<Pokemon> get pokemon => pokemons;

  void _addPokemon(Pokemon value) {
    pokemons.add(value);
  }

  Future<Pokemon> getPokemon(String query) async {
    final int id = QueryUtils.toId(query);
    Pokemon result = pokemons.firstWhere((p) => p.name == query || p.id == id,
        orElse: () => null);

    if (result == null) {
      result = await Pokemon.get(QueryUtils.toQueryable(query));
      _addPokemon(result);
    }

    return result;
  }
}
