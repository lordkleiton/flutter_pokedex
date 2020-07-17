import 'package:flutter/material.dart';
import 'package:flutter_pokedex/utils/classes/colors.dart';
import 'package:flutter_pokedex/utils/classes/extensions.dart';
import 'package:flutter_pokedex/utils/classes/types.dart';
import 'package:flutter_pokedex/utils/enums/types.dart';

class TypeBadgeWidget extends StatelessWidget {
  final String type;

  TypeBadgeWidget({Key key, this.type}) : super(key: key);

  Widget build(BuildContext context) {
    final Types _type = TypeUtils.toEnum(type);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorUtils.typeBorderColor(_type)),
        color: ColorUtils.typeColor(_type),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        type.capitalize().eliminateDashes(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
