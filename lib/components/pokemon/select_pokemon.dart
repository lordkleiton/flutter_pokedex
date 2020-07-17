import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/type/type_badges.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/components/utils/sprite.dart';
import 'package:flutter_pokedex/state/app_state_pokemon.dart';
import 'package:flutter_pokedex/utils/pokemon.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';

class SelectPokemonComponent extends StatelessWidget {
  final NamedApiResource data;

  SelectPokemonComponent({Key key, @required this.data}) : super(key: key);

  Widget build(BuildContext context) {
    final AppStatePokemon state = Provider.of(context);
    final Pokemon pokemon = state.get(data.url);
    final double width = 100;
    final double heigth = 100;
    final double padding = 10.0;

    if (pokemon == null) {
      return Container(
        width: width,
        height: heigth,
        padding: EdgeInsets.symmetric(vertical: padding),
        child: LoadingIndicatorWidget(),
      );
    }

    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: width,
              height: heigth,
              child: SpriteWidget(
                url: pokemon.sprites.frontDefault,
                popup: false,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    PokemonUtils.name(pokemon),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '#${pokemon.id.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      TypeBadgesWidget(
                        types: pokemon.types,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/pokemon', arguments: {'pokemon': pokemon});
      },
    );
  }
}
