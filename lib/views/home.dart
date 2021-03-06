import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon/select_pokemon.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/utils/pokemon.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<HomeView> {
  Future<NamedApiResourceList> _initialPokemons;

  void initState() {
    super.initState();

    _initialPokemons = compute(PokemonUtils.find, {'limit': 151, 'skip': 0});
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: FutureBuilder(
          future: _initialPokemons,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: LoadingIndicatorWidget(),
              );

            final NamedApiResourceList data = snapshot.data;

            return ListView.separated(
              separatorBuilder: (contex, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Divider(
                  height: 1,
                ),
              ),
              itemCount: data.results.length,
              itemBuilder: (context, index) => SelectPokemonComponent(
                data: data.results.elementAt(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
