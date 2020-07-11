import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/state/app_state_utils.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class AppStateMoves extends AppStateUtils with ChangeNotifier {
  Map<int, Move> _moves = {};

  Map<int, Move> get moves => _moves;

  Move getMove(String url) {
    final int id = toId(url);
    final Move result = _moves[id];

    if (result == null) requestMove(url);

    return result;
  }

  void requestMove(String url) async {
    final int id = toId(url);

    if (notRequested(url)) {
      Move.get(id.toString()).then((value) {
        _moves[id] = value;

        notifyListeners();
      }).catchError((e, s) => reqErrHandler(e, s, url));
    }
  }

  List<Move> getMovesFromList(List<PokemonMove> moves) {
    List<Move> result = [];

    moves.forEach((m) {
      final Move move = getMove(m.move.url);

      if (move != null) result.add(move);
    });

    return result;
  }
}
