import 'package:flutter_pokedex/models/api_resource.dart';

class NamedApiResource extends ApiResource {
  String name;

  NamedApiResource.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.name = json['name'];
  }

  @override
  String toString() =>
      'NamedApiResource {name: ${this.name}, url: ${this.url}}';
}
