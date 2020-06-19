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
        berries = NamedApiResource.fromList(json['berries']),
        names = Name.fromList(json['names']);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, berries: $berries, names: $names}';
}
