import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/network/rest.dart';

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

  static Future<EncounterMethod> get(String query) async =>
      EncounterMethod.fromJson(
          await RestConnection.get<EncounterMethod>(query));

  @override
  String toString() =>
      '$runtimeType {id: $id, name: $name, order: $order, names: $names}';
}
