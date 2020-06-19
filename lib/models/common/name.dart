import 'package:flutter_pokedex/models/utils/has_language.dart';

class Name extends HasLanguage {
  String name;

  Name.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        super.fromJson(json);

  @override
  toString() => '$runtimeType {name: $name, language: $language}';
}
