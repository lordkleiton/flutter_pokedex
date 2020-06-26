import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class MoveDamageClass {
  int id;
  String name;
  List<Description> descriptions;
  List<NamedApiResource> moves;
  List<Name> names;

  MoveDamageClass.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        descriptions = Description.fromList(json['descriptions'] ?? []),
        moves = NamedApiResource.fromList(json['moves'] ?? []),
        names = Name.fromList(json['names'] ?? []);

  static Future<MoveDamageClass> get(String query) async =>
      MoveDamageClass.fromJson(
          await RestConnection.get<MoveDamageClass>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, descriptions: $descriptions, moves: $moves, names: $names}';
}
