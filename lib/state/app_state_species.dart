import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStateSpecies extends AppStateUtils with ChangeNotifier {
  Map<int, PokemonSpecies> _species = {};

  Map<int, PokemonSpecies> get species => _species;

  PokemonSpecies getSpecies(String url) {
    final int id = toId(url);
    final PokemonSpecies result = _species[id];

    if (result == null) requestSpecies(url);

    return result;
  }

  void requestSpecies(String url) async {
    final int id = toId(url);

    if (notRequested(id)) {
      requested(url);

      PokemonSpecies.get(id.toString()).then((value) {
        _species[id] = value;

        notifyListeners();
      }).catchError((e, s) => reqErrHandler(e, s, id));
    }
  }
}
