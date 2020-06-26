import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class EncounterCondition {
  int id;
  String name;
  List<Name> names;
  List<NamedApiResource> values;

  EncounterCondition.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []),
        values = NamedApiResource.fromList(json['values'] ?? []);

  static Future<EncounterCondition> get(String query) async =>
      EncounterCondition.fromJson(
          await RestConnection.get<EncounterCondition>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, values: $values}';
}
