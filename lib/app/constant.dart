import 'package:flutter/material.dart';

class PartsColors {
  static Color chestColor = Colors.purple;
  static Color backColor = Colors.blue;
  static Color shoulderColor = Colors.green;
  static Color armColor = Colors.pinkAccent;
  static Color absColor = const Color.fromARGB(255, 59, 255, 209);
  static Color legColor = Colors.orangeAccent;

  static Color getColor(int partsId) {
    switch (partsId) {
      case 0:
        return legColor;
      case 1:
        return backColor;
      case 2:
        return shoulderColor;
      case 3:
        return armColor;
      case 4:
        return absColor;
      case 5:
        return chestColor;
      default:
        return Colors.white;
    }
  }
}
