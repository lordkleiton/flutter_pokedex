import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

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

  static Future<Characteristic> get(String query) async =>
      Characteristic.fromJson(await RestConnection.get<Characteristic>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, geneModulo: $geneModulo, possibleValues: $possibleValues, highestStat; $highestStat, descriptions: $descriptions}';
}
