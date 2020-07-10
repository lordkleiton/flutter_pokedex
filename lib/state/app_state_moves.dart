import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

mixin AppStateMoves {
  Map<int, Move> _moves = {};

  Map<int, Move> get moves => _moves;

  Future<Move> getMove(String url) async {
    final int id = QueryUtils.toId(url);

    Move result = _moves[id];

    if (result == null) {
      result = await compute(Move.get, id.toString());
      _moves[id] = result;
    }

    return result;
  }

  Future<List<Move>> getMovesFromList(List<PokemonMove> moves) async {
    List<Move> result = [];

    moves.forEach((element) async {
      result.add(await getMove(element.move.url));
    });

    return result;
  }
}
