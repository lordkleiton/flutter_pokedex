import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/type/badge.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:flutter_pokedex/utils/classes/extensions.dart';

class MoveWidget extends StatelessWidget {
  final Move move;

  MoveWidget({Key key, this.move}) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          move.name.capitalize().eliminateDashes(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _text('PP', move.pp.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      _text('Power',
                          move.power == null ? '-' : move.power.toString()),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TypeBadgeWidget(
                  type: move.type,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String key, String value) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$key: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
