import 'package:flutter_pokedex/models/common/named_api_resource.dart';
import 'package:flutter_pokedex/models/evolution/chain_link.dart';

class EvolutionChain {
  int id;
  NamedApiResource babyTriggerItem;
  ChainLink chain;

  EvolutionChain.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        babyTriggerItem =
            NamedApiResource.fromJson(json['baby_trigger_item'] ?? {}),
        chain = ChainLink.fromJson(json['chain']);

  @override
  toString() =>
      '$runtimeType {id: $id, babyTriggerItem: $babyTriggerItem, chain: $chain}';
}
