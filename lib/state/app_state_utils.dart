import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/utils/query.dart';

class AppStateUtils with ChangeNotifier {
  Map<int, String> _requested = {};

  bool _notRequested(int id) => _requested[id] == null;

  int toId(String url) => QueryUtils.toId(url);

  void getSingle(Function future, String url, dynamic property) {
    final int id = toId(url);

    if (_notRequested(id)) {
      print(id);

      _requested[toId(url)] = url;

      future(id.toString()).then((value) {
        property[id] = value;

        notifyListeners();
      }).catchError((err, stack) {
        print(err);
        print(stack);

        _requested.remove(id);
      });
    }
  }
}
