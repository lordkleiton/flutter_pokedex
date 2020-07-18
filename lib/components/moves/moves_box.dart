import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/moves/move.dart';
import 'package:flutter_pokedex/state/app_state_moves.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';

class MovesBoxWidget extends StatefulWidget {
  final Pokemon pokemon;

  MovesBoxWidget({Key key, @required this.pokemon}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<MovesBoxWidget> {
  Widget build(BuildContext context) {
    final Pokemon pokemon = widget.pokemon;
    final AppStateMoves appMoves = Provider.of(context);
    final List<Move> moves = appMoves.getMovesFromList(pokemon.moves);

    return Column(
      children: <Widget>[
        Text('Moves'),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: moves.length,
            itemBuilder: (context, index) => MoveWidget(
              move: moves.elementAt(index),
            ),
          ),
        )
      ],
    );
  }
}
