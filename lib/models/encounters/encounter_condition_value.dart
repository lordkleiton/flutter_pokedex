import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class EncounterConditionValue {
  int id;
  String name;
  NamedApiResource condition;
  List<Name> names;

  EncounterConditionValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        condition = NamedApiResource.fromJson(json['condition']),
        names = Name.fromList(json['names'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, condition: $condition, names: $names}';
}
