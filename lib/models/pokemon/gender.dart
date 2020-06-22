import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/pokemon/pokemon_species_gender.dart';

class Gender {
  int id;
  String name;
  List<PokemonSpeciesGender> pokemonSpeciesDetails;
  List<NamedApiResource> requiredForEvolution;

  Gender.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        pokemonSpeciesDetails = PokemonSpeciesGender.fromList(
            json['pokemon_species_details'] ?? []),
        requiredForEvolution =
            NamedApiResource.fromList(json['required_for_evolution'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, pokemonSpeciesDetails: $pokemonSpeciesDetails, requiredForEvolution: $requiredForEvolution}';
}
