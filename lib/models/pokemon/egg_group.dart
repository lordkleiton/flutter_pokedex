import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class EggGroup {
  int id;
  String name;
  List<Name> names;
  List<NamedApiResource> pokemonSpecies;

  EggGroup.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        pokemonSpecies =
            NamedApiResource.fromList(json['pokemon_species'] ?? []);

  static List<EggGroup> fromList(List<dynamic> list) =>
      list.map((e) => EggGroup.fromJson(e ?? {})).toList();

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, pokemonSpecies: $pokemonSpecies}';
}
