import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/contests/contest_name.dart';
import 'package:flutter_pokedex/network/rest.dart';

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

  static Future<ContestType> get(String query) async =>
      ContestType.fromJson(await RestConnection.get<ContestType>(query));

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, berryFlavor: $berryFlavor, names: $names}';
}
