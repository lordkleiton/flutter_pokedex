import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/items/item_pocket.dart';
import 'package:flutter_pokedex/models/locations/location.dart';
import 'package:flutter_pokedex/models/locations/location_area.dart';
import 'package:flutter_pokedex/models/locations/pal_park_area.dart';
import 'package:flutter_pokedex/models/locations/region.dart';
import 'package:flutter_pokedex/models/machines/machines.dart';
import 'package:flutter_pokedex/models/moves/move.dart';
import 'package:flutter_pokedex/models/moves/move_ailment.dart';
import 'package:flutter_pokedex/models/moves/move_battle_style.dart';
import 'package:flutter_pokedex/models/moves/move_category.dart';
import 'package:flutter_pokedex/models/moves/move_damage_class.dart';
import 'package:flutter_pokedex/models/moves/move_learn_method.dart';
import 'package:flutter_pokedex/models/moves/move_target.dart';
import 'package:flutter_pokedex/network/endpoints.dart';
import 'package:flutter_pokedex/network/rest.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String msg = '';

  void _incrementCounter() {
    RestConnection.get('1', Endpoints.move_target).then((value) {
      String res = MoveTarget.fromJson(value).toString();
      print(res);

      setState(() {
        msg = res;
      });
    }).catchError((e, s) {
      print(e);
      print(s);
    });

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: SingleChildScrollView(
                child: Text(msg),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
