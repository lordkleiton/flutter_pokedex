import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStateMoves extends AppStateUtils {
  Map<int, Move> _moves = {};

  Map<int, Move> get moves => _moves;

  Move get(String url) => getSingle<Move>(Move.get, url, _moves);

  List<Move> getMovesFromList(List<PokemonMove> moves) {
    List<Move> result = [];

    moves.forEach((m) {
      final Move move = get(m.move.url);

      if (move != null) result.add(move);
    });

    return result;
  }
}
