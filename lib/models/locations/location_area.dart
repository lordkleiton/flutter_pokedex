import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/locations/encounter_method_rate.dart';
import 'package:flutter_pokedex/models/locations/pokemon_encounter.dart';

class LocationArea {
  int id;
  String name;
  int gameIndex;
  List<EncounterMethodRate> encounterMethodRates;
  NamedApiResource location;
  List<Name> names;
  List<PokemonEncounter> pokemonEncounters;

  LocationArea.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        gameIndex = json['game_index'],
        encounterMethodRates =
            EncounterMethodRate.fromList(json['encounterMethodRates'] ?? []),
        location = NamedApiResource.fromJson(json['location'] ?? {}),
        names = Name.fromList(json['names'] ?? []),
        pokemonEncounters =
            PokemonEncounter.fromList(json['pokemon_encounters'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, gameIndex: $gameIndex, encounterMethodRates: $encounterMethodRates, location: $location, names: $names, pokemonEncounters: $pokemonEncounters}';
}
