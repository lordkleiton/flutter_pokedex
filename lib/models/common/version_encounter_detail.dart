import 'package:flutter_pokedex/models/common/encounter.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class VersionEncounterDetail {
  NamedApiResource version;
  int maxChance;
  Encounter encounterDetails;

  VersionEncounterDetail.fromJson(Map<String, dynamic> json)
      : version = NamedApiResource.fromJson(json['version']),
        maxChance = json['max_chance'],
        encounterDetails = Encounter.fromJson(json['encounter_details']);

  @override
  toString() =>
      '$runtimeType {version: $version, maxChance: $maxChance, encounterDetails: $encounterDetails}';
}
