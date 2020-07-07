import 'package:flutter/material.dart';
import 'package:flutter_pokedex/views/home.dart';

abstract class Routes {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    final Object args = settings.arguments;

    switch (settings.name) {
      case '/':
        return _h(HomeView());
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
