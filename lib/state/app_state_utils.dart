import 'package:flutter_pokedex/utils/query.dart';

class AppStateUtils {
  List<String> _requested = [];

  void requested(String url) {
    _requested.add(url);
  }

  bool notRequested(String url) => !_requested.contains(url);

  int toId(String url) => QueryUtils.toId(url);

  void reqErrHandler(err, stack, url) {
    print(err);
    print(stack);

    _requested.remove(url);
  }
}
