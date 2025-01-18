import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
//paletas de colores para personalización :D
const List<Color> _colorThemes = [
  Color(0xFF1b55ac), // #1b55ac
  Color(0xFF2b7db1), // #2b7db1
  Color(0xFF4fb4d8), // #4fb4d8
  Color(0xFFa8e2f0), // #a8e2f0
  Color(0xFFf9fafb), // #f9fafb
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Colors must be positive'),
        assert(selectedColor < _colorThemes.length,
            'Colors must be less than ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
