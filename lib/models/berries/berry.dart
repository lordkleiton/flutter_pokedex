import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/berries/berry_flavor_map.dart';

class Berry {
  int id;
  String name;
  int growthTime;
  int maxHarvest;
  int naturalGiftPower;
  int size;
  int smoothness;
  int soilDryness;
  NamedApiResource firmness;
  List<BerryFlavorMap> flavors;
  NamedApiResource item;
  NamedApiResource naturalGiftType;

  Berry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        growthTime = json['growth_time'],
        maxHarvest = json['max_harvest'],
        naturalGiftPower = json['natural_gift_power'],
        size = json['size'],
        smoothness = json['smoothness'],
        soilDryness = json['soil_dryness'],
        firmness = NamedApiResource.fromJson(json['firmness']),
        flavors = (json['flavors'] as List<dynamic>)
            .map((e) => BerryFlavorMap.fromJson(e))
            .toList(),
        item = NamedApiResource.fromJson(json['item']),
        naturalGiftType = NamedApiResource.fromJson(json['natural_gift_type']);

  @override
  String toString() =>
      '$runtimeType {id: $id, name: $name, growthTime: $growthTime, maxHarvest: $maxHarvest, naturalGiftPower: $naturalGiftPower, size: $size, smoothness: $smoothness, soilDryness: $soilDryness, firmness: $firmness, flavors: $flavors, item: $item, naturalGiftType: $naturalGiftType}';
}
