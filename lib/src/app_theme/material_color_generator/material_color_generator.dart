//material_color_generator.dart
//modified code from:
//https://gist.github.com/moritzmorgenroth/5602102d855efde2d686b0c7c5a095ad

import 'dart:math';
import 'package:flutter/material.dart';

class MaterialColorGenerator {
  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.5),
      100: tintColor(color, 0.4),
      200: tintColor(color, 0.3),
      300: tintColor(color, 0.2),
      400: tintColor(color, 0.1),
      500: tintColor(color, 0),
      600: tintColor(color, -0.1),
      700: tintColor(color, -0.2),
      800: tintColor(color, -0.3),
      900: tintColor(color, -0.4),
    });
  }
}
