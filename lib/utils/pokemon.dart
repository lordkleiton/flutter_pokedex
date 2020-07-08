import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

abstract class PokemonUtils {
  static Future<NamedApiResourceList> find(Map<String, int> data) async {
    final int limit = data['limit'] ?? 0;
    final int skip = data['skip'] ?? 0;

    return Pokemon.find(limit, skip);
  }
}
