import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon/select_pokemon.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/utils/pokemon.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<NamedApiResourceList> _initialPokemons;

  void initState() {
    super.initState();

    _initialPokemons = compute(PokemonUtils.find, {'limit': 151, 'skip': 0});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: _initialPokemons,
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

            return ListView.separated(
              separatorBuilder: (contex, index) => Divider(
                height: 1,
              ),
              itemCount: children.length,
              itemBuilder: (context, index) => children.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}
