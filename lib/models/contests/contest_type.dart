import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/contests/contest_name.dart';

class ContestType {
  int id;
  String name;
  NamedApiResource berryFlavor;
  List<ContestName> names;

  ContestType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        berryFlavor = NamedApiResource.fromJson(json['berry_flavor']),
        names = ContestName.fromList(json['names'] ?? []);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, berryFlavor: $berryFlavor, names: $names}';
}
