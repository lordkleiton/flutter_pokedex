import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/pokemon/growth_rate_experience_level.dart';
import 'package:flutter_pokedex/network/rest.dart';

class GrowthRate {
  int id;
  String name;
  String formula;
  List<Description> descriptions;
  List<GrowthRateExperienceLevel> levels;
  List<NamedApiResource> pokemonSpecies;

  GrowthRate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        formula = json['formula'],
        descriptions = Description.fromList(json['descriptions'] ?? []),
        levels = GrowthRateExperienceLevel.fromList(json['levels'] ?? []),
        pokemonSpecies = NamedApiResource.fromList(json['pokemon_species']);

  static Future<GrowthRate> get(String query) async =>
      GrowthRate.fromJson(await RestConnection.get<GrowthRate>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, formula: $formula, descriptions: $descriptions, levels: $levels, pokemonSpecies: $pokemonSpecies}';
}
