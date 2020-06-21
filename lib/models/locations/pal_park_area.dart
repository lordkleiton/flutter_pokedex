import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/locations/pal_park_encounter_species.dart';

class PalParkArea {
  int id;
  String name;
  List<Name> names;
  List<PalParkEncounterSpecies> pokemonEncounters;

  PalParkArea.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        pokemonEncounters =
            PalParkEncounterSpecies.fromList(json['pokemon_encounters'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, pokemonEncounters: $pokemonEncounters}';
}
