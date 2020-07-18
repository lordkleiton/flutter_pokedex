import 'package:flutter/material.dart';
import 'package:flutter_pokedex/views/home.dart';
import 'package:flutter_pokedex/views/pokemon.dart';
import 'package:flutter_pokedex/views/type.dart';

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
      case '/type':
        return _h(TypeView(
          type: args['type'],
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
