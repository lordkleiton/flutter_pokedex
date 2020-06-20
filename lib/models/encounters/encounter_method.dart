import 'package:flutter_pokedex/models/common/name.dart';

class EncounterMethod {
  int id;
  String name;
  int order;
  List<Name> names;

  EncounterMethod.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        order = json['order'],
        names = Name.fromList(json['names'] ?? []);

  @override
  String toString() =>
      '$runtimeType {id: $id, name: $name, order: $order, names: $names}';
}
