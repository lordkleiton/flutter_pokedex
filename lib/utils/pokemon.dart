import 'package:flutter_pokedex/utils/classes/extensions.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

abstract class PokemonUtils {
  static String name(Pokemon pokemon) =>
      pokemon.name.capitalize().eliminateDashes();

  static Future<NamedApiResourceList> find(Map<String, int> data) async {
    final int limit = data['limit'] ?? 0;
    final int skip = data['skip'] ?? 0;

    return Pokemon.find(limit, skip);
  }
}
