import 'package:flutter_pokedex/models/base/resource_list.dart';
import 'package:flutter_pokedex/models/base/named_api_resource.dart';

class NamedApiResourceList extends ResourceList {
  List<NamedApiResource> results;

  NamedApiResourceList.fromJson(Map<String, dynamic> json)
      : results = (json['results'] as List<dynamic>)
            .map((e) => NamedApiResource.fromJson(e))
            .toList(),
        super.fromJson(json);

  @override
  String toString() =>
      '$runtimeType {count: $count, previous: $previous, next: $next, results: $results}';
}
