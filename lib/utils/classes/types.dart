import 'package:flutter_pokedex/utils/enums/types.dart';

abstract class TypeUtils {
  static Types toEnum(String type) {
    switch (type) {
      case 'normal':
        return Types.normal;
      case 'fire':
        return Types.fire;
      case 'fighting':
        return Types.fighting;
      case 'water':
        return Types.water;
      case 'flying':
        return Types.flying;
      case 'grass':
        return Types.grass;
      case 'poison':
        return Types.poison;
      case 'electric':
        return Types.electric;
      case 'ground':
        return Types.ground;
      case 'psychic':
        return Types.psychic;
      case 'rock':
        return Types.rock;
      case 'ice':
        return Types.ice;
      case 'bug':
        return Types.bug;
      case 'dragon':
        return Types.dragon;
      case 'ghost':
        return Types.ghost;
      case 'dark':
        return Types.dark;
      case 'steel':
        return Types.steel;
      case 'fairy':
        return Types.fairy;
      default:
        return Types.question;
    }
  }
}
