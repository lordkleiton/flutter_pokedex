import 'package:flutter_pokedex/models/common/effect.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class ItemFlingEffect {
  int id;
  String name;
  List<Effect> effectEntries;
  List<NamedApiResource> items;

  ItemFlingEffect.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        effectEntries = Effect.fromList(json['effect_entries']),
        items = NamedApiResource.fromList(json['items']);

  @override
  toString() =>
      '$runtimeType {id: $id, name: $name, effectEntries: $effectEntries, items: $items}';
}
