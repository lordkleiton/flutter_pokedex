import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class MoveTarget {
  int id;
  String name;
  List<Description> descriptions;
  List<NamedApiResource> moves;
  List<Name> names;

  MoveTarget.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        descriptions = Description.fromList(json['descriptions'] ?? []),
        moves = NamedApiResource.fromList(json['moves'] ?? []),
        names = Name.fromList(json['names'] ?? []);

  static Future<MoveTarget> get(String query) async =>
      MoveTarget.fromJson(await RestConnection.get<MoveTarget>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, descriptions: $descriptions, moves: $moves, names: $names}';
}
