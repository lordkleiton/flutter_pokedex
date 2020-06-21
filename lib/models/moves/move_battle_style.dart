import 'package:flutter_pokedex/models/common/name.dart';

class MoveBattleStyle {
  int id;
  String name;
  List<Name> names;

  MoveBattleStyle.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []);

  @override
  toString() => '$runtimeType {id: $id, name: $name, names: $names}';
}
