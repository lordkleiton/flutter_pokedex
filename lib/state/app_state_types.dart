import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStateTypes extends AppStateUtils {
  Map<int, Type> _types = {};

  Map<int, Type> get species => _types;

  Type get(String url) => getSingle<Type>(Type.get, url, _types);
}
