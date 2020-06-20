import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class Version {
  int id;
  String name;
  List<Name> names;
  NamedApiResource versionGroup;

  Version.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        names = Name.fromList(json['names']),
        versionGroup = NamedApiResource.fromJson(json['version_group']);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, names: $names, versionGroup: $versionGroup}';
}
