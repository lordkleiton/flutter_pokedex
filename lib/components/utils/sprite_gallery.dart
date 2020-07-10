import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/utils/sprite.dart';
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

class SpriteGalleryWidget extends StatelessWidget {
  final PokemonSprites sprites;

  SpriteGalleryWidget({Key key, @required this.sprites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SpriteAux> data = [];

    if (sprites.frontDefault != null) {
      data.add(_SpriteAux(
          url: sprites.frontDefault,
          gender: _Gender._default,
          side: _Side.front,
          shiny: false));
    }
    if (sprites.backDefault != null)
      data.add(_SpriteAux(
          url: sprites.backDefault,
          gender: _Gender._default,
          side: _Side.back,
          shiny: false));

    if (sprites.frontFemale != null)
      data.add(_SpriteAux(
          url: sprites.frontFemale,
          gender: _Gender.female,
          side: _Side.front,
          shiny: false));
    if (sprites.backFemale != null)
      data.add(_SpriteAux(
          url: sprites.backFemale,
          gender: _Gender.female,
          side: _Side.back,
          shiny: false));

    if (sprites.frontFemaleShiny != null)
      data.add(_SpriteAux(
          url: sprites.frontFemaleShiny,
          gender: _Gender.female,
          side: _Side.front,
          shiny: true));
    if (sprites.backShinyFemale != null)
      data.add(_SpriteAux(
          url: sprites.backShinyFemale,
          gender: _Gender.female,
          side: _Side.back,
          shiny: true));

    if (sprites.frontShiny != null)
      data.add(_SpriteAux(
          url: sprites.frontShiny,
          gender: _Gender._default,
          side: _Side.front,
          shiny: true));
    if (sprites.backShiny != null)
      data.add(_SpriteAux(
          url: sprites.backShiny,
          gender: _Gender._default,
          side: _Side.back,
          shiny: true));

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final _SpriteAux _data = data.elementAt(index);

        return Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 100,
          child: Column(
            children: <Widget>[
              SpriteWidget(
                url: _data.url,
              ),
              Text(_data.gender == _Gender._default ? 'default' : 'female'),
              Text(_data.side == _Side.front ? 'front' : 'back'),
              Text(_data.shiny ? 'shiny' : ''),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
      itemCount: data.length,
      shrinkWrap: true,
    );
  }
}
