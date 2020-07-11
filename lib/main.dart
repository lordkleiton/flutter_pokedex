import 'package:flutter/material.dart';
import 'package:flutter_pokedex/routes.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  final AppState appState = AppState();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState,
        child: MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => appState.pokemon,
        child: MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => appState.species,
        child: MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => appState.moves,
        child: MyApp(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
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
