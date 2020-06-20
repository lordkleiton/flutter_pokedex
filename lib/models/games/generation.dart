import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class Generation {
  int id;
  String name;
  List<NamedApiResource> abilities;
  List<Name> names;
  NamedApiResource mainRegion;
  List<NamedApiResource> moves;
  List<NamedApiResource> pokemonSpecies;
  List<NamedApiResource> types;
  List<NamedApiResource> versionGroups;

  Generation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        abilities = _h(json['abilities']),
        names = Name.fromList(json['names'] ?? []),
        mainRegion = NamedApiResource.fromJson(json['main_region'] ?? {}),
        moves = _h(json['moves']),
        pokemonSpecies = _h(json['pokemon_species']),
        types = _h(json['types']),
        versionGroups = _h(json['version_groups']);

  static List<NamedApiResource> _h(List<dynamic> list) =>
      NamedApiResource.fromList(list ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, abilities: $abilities, names: $names, mainRegion: $mainRegion, moves: $moves, pokemonSpecies: $pokemonSpecies, types: $types, versionGroups: $versionGroups}';
}
