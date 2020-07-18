import 'package:flutter/material.dart';
import 'package:flutter_pokedex/settings.dart';
import 'package:flutter_pokedex/state/app_state_types.dart';
import 'package:flutter_pokedex/utils/classes/colors.dart';
import 'package:flutter_pokedex/utils/classes/extensions.dart';
import 'package:flutter_pokedex/utils/classes/types.dart';
import 'package:flutter_pokedex/utils/enums/types.dart';
import 'package:pokeapi_dart_lib/pokeapi_dart_lib.dart';
import 'package:provider/provider.dart';

class TypeBadgeWidget extends StatelessWidget {
  final NamedApiResource type;

  TypeBadgeWidget({Key key, this.type}) : super(key: key);

  Widget build(BuildContext context) {
    final AppStateTypes state = Provider.of(context);
    final Type _type = state.get(type.url);
    final String name = _type?.name ?? type.name;
    final Types _types = TypeUtils.toEnum(name);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Settings.borderRadius),
        border: Border.all(color: ColorUtils.typeBorderColor(_types)),
        color: ColorUtils.typeColor(_types),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        name.capitalize(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
