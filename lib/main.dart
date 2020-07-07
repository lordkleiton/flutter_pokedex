import 'package:flutter/material.dart';
import 'package:flutter_pokedex/routes.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppState(),
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
