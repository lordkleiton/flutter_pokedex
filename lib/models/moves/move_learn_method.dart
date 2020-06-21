import 'package:flutter_pokedex/models/common/description.dart';
import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class MoveLearnMethod {
  int id;
  String name;
  List<Description> descriptions;
  List<Name> names;
  List<NamedApiResource> versionGroups;

  MoveLearnMethod.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        descriptions = Description.fromList(json['descriptions'] ?? []),
        names = Name.fromList(json['names'] ?? []),
        versionGroups = NamedApiResource.fromList(json['version_groups'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, descriptions: $descriptions, versionGroups: $versionGroups, names: $names}';
}
