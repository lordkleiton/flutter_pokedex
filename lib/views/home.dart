import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pokedex/components/utils/loading_spinner_circle.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:flutter_pokedex/utils/state.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<NamedApiResourceList> future;

  @override
  void initState() {
    super.initState();

    future = Pokemon.find(60);
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = StateUtils.appState(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: LoadingSpinningCircle(),
              );

            final NamedApiResourceList data = snapshot.data;
            final List<Widget> children = data.results
                .map(
                  (e) => InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        e.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      appState.getPokemon(e.url).then((value) {
                        print(value);
                      });
                    },
                  ),
                )
                .toList();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
