import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/pokemon/nature_pokeathlon_stat_affect_sets.dart';
import 'package:flutter_pokedex/network/rest.dart';

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

  static Future<PokeathlonStat> get(String query) async =>
      PokeathlonStat.fromJson(await RestConnection.get<PokeathlonStat>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, affectingNatures: $affectingNatures}';
}
