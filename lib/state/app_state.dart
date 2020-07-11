import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/state/app_state_moves.dart';
import 'package:flutter_pokedex/state/app_state_pokemon.dart';
import 'package:flutter_pokedex/state/app_state_species.dart';

class AppState extends ChangeNotifier {
  final AppStatePokemon pokemon = AppStatePokemon();
  final AppStateSpecies species = AppStateSpecies();
  final AppStateMoves moves = AppStateMoves();
}
