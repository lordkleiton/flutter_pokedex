import 'package:flutter_pokedex/models/utils/has_language.dart';

class Description extends HasLanguage {
  String description;

  Description.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        super.fromJson(json ?? {});

  @override
  toString() => '$runtimeType {description: $description, language: $language}';
}
