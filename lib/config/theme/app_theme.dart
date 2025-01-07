import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
//paletas de colores para personalización :D
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
  
];

class AppTheme{

  final int selectedColor;

  AppTheme({this.selectedColor = 0}): assert(selectedColor >=0, 'Colors must be positive' ),assert(selectedColor <_colorThemes.length,'Colors must be less than ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}