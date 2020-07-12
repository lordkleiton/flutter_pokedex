import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStatePokemon extends AppStateUtils with ChangeNotifier {
  Map<int, Pokemon> _pokemons = {};

  Map<int, Pokemon> get pokemons => _pokemons;

  Pokemon getPokemon(String url) {
    final int id = toId(url);
    final Pokemon result = _pokemons[id];

    if (result == null) requestPokemon(url);

    return result;
  }

  void requestPokemon(String url) async {
    final int id = toId(url);

    if (notRequested(id)) {
      requested(url);

      Pokemon.get(id.toString()).then((value) {
        _pokemons[id] = value;

        notifyListeners();
      }).catchError((e, s) => reqErrHandler(e, s, id));
    }
  }
}
