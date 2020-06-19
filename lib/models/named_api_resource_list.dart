import 'package:flutter_pokedex/models/resource_list.dart';
import 'package:flutter_pokedex/models/named_api_resource.dart';

class NamedApiResourceList extends ResourceList {
  List<NamedApiResource> results;

  NamedApiResourceList.fromJson(Map<String, dynamic> json)
      : results = (json['results'] as List<dynamic>)
            .map((e) => NamedApiResource.fromJson(e))
            .toList(),
        super.fromJson(json);

  @override
  String toString() =>
      '${this.runtimeType} {count: $count, previous: $previous, next: $next, results: $results}';
}
