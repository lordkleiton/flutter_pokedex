import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class PokemonColor {
  int id;
  String name;
  List<Name> names;
  List<NamedApiResource> pokemonSpecies;

  PokemonColor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        pokemonSpecies =
            NamedApiResource.fromList(json['pokemon_species'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, pokemonspecies: $pokemonSpecies}';
}
