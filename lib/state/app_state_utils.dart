import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';

class AppStateUtils with ChangeNotifier {
  Map<int, String> _requested = {};

  void requested(String url) {
    _requested[toId(url)] = url;
  }

  bool notRequested(int id) => _requested[id] == null;

  int toId(String url) => QueryUtils.toId(url);

  void reqErrHandler(err, stack, int id) {
    print(err);
    print(stack);

    _requested.remove(id);
  }
}
