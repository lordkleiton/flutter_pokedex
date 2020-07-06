import 'package:flutter/material.dart';
import 'package:flutter_pokedex/state/app_state.dart';
import 'package:flutter_pokedex/utils/state.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = StateUtils.appState(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Pokemon.find(60),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

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
                      //print(QueryUtils.toQueryable(e.url));
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
