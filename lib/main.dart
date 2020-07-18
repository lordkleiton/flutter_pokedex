import 'package:flutter/material.dart';
import 'package:flutter_pokedex/routes.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  final AppState appState = AppState();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState.pokemon,
      ),
      ChangeNotifierProvider(
        create: (context) => appState.species,
      ),
      ChangeNotifierProvider(
        create: (context) => appState.moves,
      ),
      ChangeNotifierProvider(
        create: (context) => appState.types,
      ),
    ],
    child: FlutterPokedex(),
  ));
}

class FlutterPokedex extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokéapi Client',
      onGenerateRoute: Routes.routeGenerator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
