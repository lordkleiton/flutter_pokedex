import 'package:flutter_pokedex/state/app_state_moves.dart';
import 'package:flutter_pokedex/state/app_state_pokemon.dart';
import 'package:flutter_pokedex/state/app_state_species.dart';
import 'package:flutter_pokedex/state/app_state_types.dart';

class AppState {
  final AppStatePokemon pokemon = AppStatePokemon();
  final AppStateSpecies species = AppStateSpecies();
  final AppStateMoves moves = AppStateMoves();
  final AppStateTypes types = AppStateTypes();
}
