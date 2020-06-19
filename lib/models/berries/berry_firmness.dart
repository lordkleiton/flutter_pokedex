import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class BerryFirmness {
  int id;
  String name;
  List<NamedApiResource> berries;
  List<Name> names;

  BerryFirmness.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        berries = (json['berries'] as List<dynamic>)
            .map((e) => NamedApiResource.fromJson(e))
            .toList(),
        names = (json['names'] as List<dynamic>)
            .map((e) => Name.fromJson(e))
            .toList();

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, berries: $berries, names: $names}';
}
