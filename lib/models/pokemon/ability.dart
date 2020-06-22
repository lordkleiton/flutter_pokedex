import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/common/verbose_effect.dart';
import 'package:flutter_pokedex/models/pokemon/ability_effect_change.dart';
import 'package:flutter_pokedex/models/pokemon/ability_flavor_text.dart';
import 'package:flutter_pokedex/models/pokemon/ability_pokemon.dart';

class Ability {
  int id;
  String name;
  bool isMainSeries;
  NamedApiResource generation;
  List<Name> names;
  List<VerboseEffect> effectEntries;
  List<AbilityEffectChange> effectChanges;
  List<AbilityFlavorText> flavorTextEntries;
  List<AbilityPokemon> pokemon;

  Ability.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        isMainSeries = json['is_main_series'],
        generation = NamedApiResource.fromJson(json['generation'] ?? {}),
        effectEntries = VerboseEffect.fromList(json['effect_entries'] ?? []),
        effectChanges =
            AbilityEffectChange.fromList(json['effect_changes'] ?? []),
        flavorTextEntries =
            AbilityFlavorText.fromList(json['flavor_text_entries']),
        pokemon = AbilityPokemon.fromList(json['pokemon'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, isMainSeries: $isMainSeries, generation: $generation, effectentries: $effectEntries, effectChanges: $effectChanges, flavorTextEntries: $flavorTextEntries, pokemon: $pokemon}';
}
