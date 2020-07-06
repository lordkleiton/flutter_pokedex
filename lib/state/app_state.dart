import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppState extends ChangeNotifier {
  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemon => _pokemons;
  void _addPokemon(Pokemon value) {
    _pokemons.add(value);
    notifyListeners();
  }

  /*  */

  Future<Pokemon> getPokemon(String query) async {
    final int id = QueryUtils.toId(query);
    Pokemon result = _pokemons.firstWhere((p) => p.name == query || p.id == id,
        orElse: () => null);

    if (result == null) {
      result = await Pokemon.get(QueryUtils.toQueryable(query));
      _addPokemon(result);
    }

    return result;
  }
}
