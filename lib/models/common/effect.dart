import 'package:flutter_pokedex/models/utils/has_language.dart';

class Effect extends HasLanguage {
  String effect;

  Effect.fromJson(Map<String, dynamic> json)
      : effect = json['description'],
        super.fromJson(json);

  @override
  toString() => '$runtimeType {effect: $effect, language: $language}';
}
