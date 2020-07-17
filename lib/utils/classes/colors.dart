import 'dart:ui';
import 'package:flutter_pokedex/utils/enums/types.dart';

abstract class ColorUtils {
  static Color typeColor(Types type) {
    switch (type) {
      case Types.normal:
        return hex2color('A8A878');
      case Types.fire:
        return hex2color('F08030');
      case Types.fighting:
        return hex2color('C03028');
      case Types.water:
        return hex2color('6890F0');
      case Types.flying:
        return hex2color('A890F0');
      case Types.grass:
        return hex2color('78C850');
      case Types.poison:
        return hex2color('A040A0');
      case Types.electric:
        return hex2color('F8D030');
      case Types.ground:
        return hex2color('E0C068');
      case Types.psychic:
        return hex2color('F85888');
      case Types.rock:
        return hex2color('B8A038');
      case Types.ice:
        return hex2color('98D8D8');
      case Types.bug:
        return hex2color('A8B820');
      case Types.dragon:
        return hex2color('7038F8');
      case Types.ghost:
        return hex2color('705898');
      case Types.dark:
        return hex2color('705848');
      case Types.steel:
        return hex2color('B8B8D0');
      case Types.fairy:
        return hex2color('EE99AC');
      default:
        return hex2color('68A090');
    }
  }

  static Color typeBorderColor(Types type) {
    switch (type) {
      case Types.normal:
        return hex2color('6D6D4E');
      case Types.fire:
        return hex2color('9C531F');
      case Types.fighting:
        return hex2color('7D1F1A');
      case Types.water:
        return hex2color('445E9C');
      case Types.flying:
        return hex2color('6D5E9C');
      case Types.grass:
        return hex2color('4E8234');
      case Types.poison:
        return hex2color('682A68');
      case Types.electric:
        return hex2color('A1871F');
      case Types.ground:
        return hex2color('927D44');
      case Types.psychic:
        return hex2color('A13959');
      case Types.rock:
        return hex2color('786824');
      case Types.ice:
        return hex2color('638D8D');
      case Types.bug:
        return hex2color('6D7815');
      case Types.dragon:
        return hex2color('4924A1');
      case Types.ghost:
        return hex2color('493963');
      case Types.dark:
        return hex2color('49392F');
      case Types.steel:
        return hex2color('787887');
      case Types.fairy:
        return hex2color('9B6470');
      default:
        return hex2color('44685E');
    }
  }

  static Color hex2color(String hexColor, {double opacity = 1.0}) =>
      Color(int.parse(hexColor.replaceAll('#', ''), radix: 16))
          .withOpacity(opacity);
}
