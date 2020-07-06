import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:provider/provider.dart';

/// classe que evita ficar poluindo com 1 milhão de imports do provider
abstract class StateUtils {
  /// retorna o estado principal
  static AppState appState(BuildContext context) =>
      Provider.of<AppState>(context);
}
