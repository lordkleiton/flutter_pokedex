import 'package:flutter_pokedex/models/base/resource_list.dart';
import 'package:flutter_pokedex/models/base/api_resource.dart';

class ApiResourceList extends ResourceList {
  List<ApiResource> results;

  ApiResourceList.fromJson(Map<String, dynamic> json)
      : results = (json['results'] as List<dynamic>)
            .map((e) => ApiResource.fromJson(e))
            .toList(),
        super.fromJson(json);

  @override
  String toString() =>
      '$runtimeType {count: $count, previous: $previous, next: $next, results: $results}';
}
