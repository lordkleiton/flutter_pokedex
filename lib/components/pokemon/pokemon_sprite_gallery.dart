import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/utils/sprite.dart';
import 'package:flutter_pokedex/components/utils/sprite_gallery.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

enum _Gender { _default, female }
enum _Side { front, back }

class _SpriteAux {
  String url;
  _Gender gender;
  _Side side;
  bool shiny;

  _SpriteAux({this.url, this.gender, this.side, this.shiny});
}

class PokemonSpriteGalleryWidget extends StatelessWidget {
  final PokemonSprites sprites;

  PokemonSpriteGalleryWidget({Key key, @required this.sprites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SpriteAux> data = [];
    List<Widget> widgets = [];

    if (sprites.frontDefault != null) {
      data.add(
        _SpriteAux(
          url: sprites.frontDefault,
          gender: _Gender._default,
          side: _Side.front,
          shiny: false,
        ),
      );
    }

    if (sprites.backDefault != null) {
      data.add(
        _SpriteAux(
          url: sprites.backDefault,
          gender: _Gender._default,
          side: _Side.back,
          shiny: false,
        ),
      );
    }

    if (sprites.frontFemale != null) {
      data.add(
        _SpriteAux(
          url: sprites.frontFemale,
          gender: _Gender.female,
          side: _Side.front,
          shiny: false,
        ),
      );
    }

    if (sprites.backFemale != null) {
      data.add(
        _SpriteAux(
          url: sprites.backFemale,
          gender: _Gender.female,
          side: _Side.back,
          shiny: false,
        ),
      );
    }

    if (sprites.frontFemaleShiny != null) {
      data.add(
        _SpriteAux(
          url: sprites.frontFemaleShiny,
          gender: _Gender.female,
          side: _Side.front,
          shiny: true,
        ),
      );
    }

    if (sprites.backShinyFemale != null) {
      data.add(
        _SpriteAux(
          url: sprites.backShinyFemale,
          gender: _Gender.female,
          side: _Side.back,
          shiny: true,
        ),
      );
    }

    if (sprites.frontShiny != null) {
      data.add(
        _SpriteAux(
          url: sprites.frontShiny,
          gender: _Gender._default,
          side: _Side.front,
          shiny: true,
        ),
      );
    }

    if (sprites.backShiny != null) {
      data.add(
        _SpriteAux(
          url: sprites.backShiny,
          gender: _Gender._default,
          side: _Side.back,
          shiny: true,
        ),
      );
    }

    widgets = data
        .map(
          (e) => Column(
            children: <Widget>[
              SpriteWidget(
                url: e.url,
              ),
              Text(e.gender == _Gender._default ? 'default' : 'female'),
              Text(e.side == _Side.front ? 'front' : 'back'),
              Text(e.shiny ? 'shiny' : ''),
            ],
          ),
        )
        .toList();

    return SpriteGalleryWidget(
      spriteWidgets: widgets,
    );
  }
}
