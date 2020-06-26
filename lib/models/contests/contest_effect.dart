import 'package:flutter_pokedex/models/common/effect.dart';
import 'package:flutter_pokedex/models/common/flavor_text.dart';
import 'package:flutter_pokedex/network/rest.dart';

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
        effectEntries = Effect.fromList(json['effect_entries'] ?? []),
        flavorTextEntries =
            FlavorText.fromList(json['flavor_text_entries'] ?? []);

  static Future<ContestEffect> get(String query) async =>
      ContestEffect.fromJson(await RestConnection.get<ContestEffect>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, appeal: $appeal, jam: $jam, effectEntries: $effectEntries, flavorTextEntries: $flavorTextEntries}';
}
