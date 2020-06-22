import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/pokemon/nature_pokeathlon_stat_affect_sets.dart';

class PokeathlonStat {
  int id;
  String name;
  List<Name> names;
  NaturePokeathlonStatAffectSets affectingNatures;

  PokeathlonStat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        affectingNatures =
            NaturePokeathlonStatAffectSets.fromJson(json['affecting_natures']);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, affectingNatures: $affectingNatures}';
}
