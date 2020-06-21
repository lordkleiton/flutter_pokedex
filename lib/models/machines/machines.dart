import 'package:flutter_pokedex/models/common/named_api_resource.dart';

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

  @override
  toString() =>
      '$runtimeType {id: $id, item: $item, move: $move, versionGroup: $versionGroup}';
}
