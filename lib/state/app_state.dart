import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/state/app_state_moves.dart';
import 'package:flutter_pokedex/state/app_state_pokemon.dart';
import 'package:flutter_pokedex/state/app_state_species.dart';

class AppState extends ChangeNotifier with AppStateMoves {
  final AppStatePokemon pokemon = AppStatePokemon();
  final AppStateSpecies species = AppStateSpecies();
}
