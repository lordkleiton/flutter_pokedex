import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class Characteristic {
  int id;
  int geneModulo;
  List<int> possibleValues;
  NamedApiResource highestStat;
  List<Description> descriptions;

  Characteristic.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        geneModulo = json['gene_modulo'],
        possibleValues = List<int>.from(json['possible_values'] ?? []),
        highestStat = NamedApiResource.fromJson(json['highest_stat'] ?? {}),
        descriptions = Description.fromList(json['descriptions'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, geneModulo: $geneModulo, possibleValues: $possibleValues, highestStat; $highestStat, descriptions: $descriptions}';
}
