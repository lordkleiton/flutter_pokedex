import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class GenerationGameIndex {
  int gameIndex;
  NamedApiResource generation;

  GenerationGameIndex.fromJson(Map<String, dynamic> json)
      : gameIndex = json['game_index'],
        generation = NamedApiResource.fromJson(json['generation']);

  @override
  toString() => '$runtimeType {gameIndex: $gameIndex, generation: $generation}';
}
