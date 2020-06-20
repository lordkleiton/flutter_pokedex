import 'package:flutter_pokedex/models/common/flavor_text.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class SuperContestEffect {
  int id;
  int appeal;
  List<FlavorText> flavorTextEntries;
  List<NamedApiResource> moves;

  SuperContestEffect.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        appeal = json['appeal'],
        flavorTextEntries =
            FlavorText.fromList(json['flavor_text_entries'] ?? []),
        moves = NamedApiResource.fromList(json['moves'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, appeal: $appeal, flavorTextEntries: $flavorTextEntries, moves: $moves}';
}
