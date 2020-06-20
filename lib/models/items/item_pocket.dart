import 'package:flutter_pokedex/models/common/name.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class ItemPocket {
  int id;
  String name;
  List<NamedApiResource> categories;
  List<Name> names;

  ItemPocket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        categories = NamedApiResource.fromList(json['categories']),
        names = Name.fromList(json['names']);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, categories: $categories, names: $names}';
}
