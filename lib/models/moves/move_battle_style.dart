import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/network/rest.dart';

class MoveBattleStyle {
  int id;
  String name;
  List<Name> names;

  MoveBattleStyle.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names'] ?? []);

  static Future<MoveBattleStyle> get(String query) async =>
      MoveBattleStyle.fromJson(
          await RestConnection.get<MoveBattleStyle>(query));

  @override
  toString() => '$runtimeType {id: $id, name: $name, names: $names}';
}
