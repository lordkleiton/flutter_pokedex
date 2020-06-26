import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class MoveCategory {
  int id;
  String name;
  List<NamedApiResource> moves;
  List<Description> descriptions;

  MoveCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        moves = NamedApiResource.fromList(json['moves'] ?? []),
        descriptions = Description.fromList(json['descriptions'] ?? []);

  static Future<MoveCategory> get(String query) async =>
      MoveCategory.fromJson(await RestConnection.get<MoveCategory>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, moves: $moves, descriptions: $descriptions}';
}
