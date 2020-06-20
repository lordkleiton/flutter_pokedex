import 'package:flutter_pokedex/models/common/effect.dart';
import 'package:flutter_pokedex/models/common/flavor_text.dart';

class ContestEffect {
  int id;
  int appeal;
  int jam;
  List<Effect> effectEntries;
  List<FlavorText> flavorTextEntries;

  ContestEffect.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        appeal = json['appeal'],
        jam = json['jam'],
        effectEntries = Effect.fromList(json['effect_entries']),
        flavorTextEntries = FlavorText.fromList(json['flavor_text_entries']);

  @override
  toString() =>
      '$runtimeType {id: $id, appeal: $appeal, jam: $jam, effectEntries: $effectEntries, flavorTextEntries: $flavorTextEntries}';
}
