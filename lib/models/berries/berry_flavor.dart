import 'package:flutter_pokedex/models/berries/flavor_berry_map.dart';
import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/network/rest.dart';

class BerryFlavor {
  int id;
  String name;
  List<FlavorBerryMap> berries;
  NamedApiResource contestType;
  List<Name> names;

  BerryFlavor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        berries = FlavorBerryMap.fromList(json['berries'] ?? []),
        names = Name.fromList(json['names'] ?? []);

  static Future<BerryFlavor> get(String query) async =>
      BerryFlavor.fromJson(await RestConnection.get<BerryFlavor>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, berries: $berries, contestType: $contestType, names: $names}';
}
