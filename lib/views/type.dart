import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/type/badge.dart';
import 'package:flutter_pokedex/state/app_state_types.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';

class TypeView extends StatelessWidget {
  final NamedApiResource type;

  TypeView({Key key, this.type}) : super(key: key);

  Widget build(BuildContext context) {
    final AppStateTypes state = Provider.of(context);
    final Type _type = state.get(type.url);

    return Scaffold(
      appBar: AppBar(
        title: Text(type.name),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            TypeBadgeWidget(
              type: type,
              clickable: false,
            )
          ],
        ),
      ),
    );
  }
}
