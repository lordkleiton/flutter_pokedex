import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon/select_pokemon.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/utils/pokemon.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<NamedApiResourceList> future;
  int a = 1;

  @override
  void initState() {
    super.initState();

    future = compute(PokemonUtils.find, {'limit': 5, 'skip': 0});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon'),
      ),
      body: Container(
        height: 500,
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: LoadingIndicatorWidget(),
              );

            final NamedApiResourceList data = snapshot.data;
            final List<Widget> children = data.results
                .map(
                  (e) => SelectPokemonComponent(
                    data: e,
                  ),
                )
                .toList();

            return ListView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) => children.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}
