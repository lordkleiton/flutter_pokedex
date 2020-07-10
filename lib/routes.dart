import 'package:flutter/material.dart';
import 'package:flutter_pokedex/views/home.dart';
import 'package:flutter_pokedex/views/pokemon.dart';

abstract class Routes {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    final Map<String, dynamic> args =
        settings.arguments as Map<String, dynamic>;

    switch (settings.name) {
      case '/':
        return _h(HomeView());
      case '/pokemon':
        return _h(PokemonView(
          pokemon: args['pokemon'],
        ));
      default:
        return _h(_err());
    }
  }

  static Widget _err() => Scaffold(
        appBar: AppBar(
          title: Text('erro'),
        ),
        body: Center(
          child: Text('você não devia ter chegado aqui'),
        ),
      );

  static MaterialPageRoute _h(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
