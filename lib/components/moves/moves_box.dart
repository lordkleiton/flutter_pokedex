import 'package:flutter/material.dart';
import 'package:flutter_pokedex/state/app_state_moves.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:flutter_pokedex/utils/extensions.dart';
import 'package:provider/provider.dart';

class MovesBoxWidget extends StatefulWidget {
  final Pokemon pokemon;
  MovesBoxWidget({Key key, @required this.pokemon}) : super(key: key);

  @override
  _MovesBoxWidget createState() => _MovesBoxWidget();
}

class _MovesBoxWidget extends State<MovesBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;
    final AppStateMoves appMoves = Provider.of(context);
    final List<Move> moves = appMoves.getMovesFromList(pokemon.moves);

    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: moves.length,
        itemBuilder: (context, index) =>
            Text(moves.elementAt(index).name.capitalize().eliminateDashes()),
      ),
    );
  }
}
