import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class Region {
  int id;
  List<NamedApiResource> locations;
  String name;
  List<Name> names;
  NamedApiResource mainGeneration;
  List<NamedApiResource> pokedexes;
  List<NamedApiResource> versionGroups;

  Region.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        locations = NamedApiResource.fromList(json['locations'] ?? []),
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        mainGeneration = NamedApiResource.fromJson(json['main_generation']),
        pokedexes = NamedApiResource.fromList(json['pokedexes'] ?? []),
        versionGroups = NamedApiResource.fromList(json['version_groups'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, locations: $locations, name: $name, names: $names, mainGeneration: $mainGeneration, pokedexes: $pokedexes, versionGroups: $versionGroups}';
}
