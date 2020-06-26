import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class Machine {
  int id;
  NamedApiResource item;
  NamedApiResource move;
  NamedApiResource versionGroup;

  Machine.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        item = NamedApiResource.fromJson(json['item'] ?? {}),
        move = NamedApiResource.fromJson(json['move'] ?? {}),
        versionGroup = NamedApiResource.fromJson(json['version_group'] ?? {});

  static Future<Machine> get(String query) async =>
      Machine.fromJson(await RestConnection.get<Machine>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, item: $item, move: $move, versionGroup: $versionGroup}';
}
