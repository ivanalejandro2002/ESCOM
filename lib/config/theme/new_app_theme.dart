import 'package:flutter/material.dart';

ColorScheme lightThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6886C5),
    onPrimary: Color(0xFFF9F9F9),
    secondary: Color(0xFFFFACB7),
    onSecondary: Color(0xFFF9F9F9),
    tertiary: Color(0xFFFFE0AC),
    onTertiary: Color(0xFFF9F9F9),
    primaryFixed: Color(0xFF1B55AC),
    secondaryFixed: Color(0xFF2B7DB1),
    tertiaryFixed: Color(0xFF4FB4D8),
    primaryFixedDim: Color(0xFFA8E2F0),

    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    surface: Color(0xFFF9F9F9),
    onSurface: Color(0xFF0D0221),
  );
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: lightThemeColors(context).surface,
    
    colorScheme: lightThemeColors(context),
  );
}

/*ColorScheme darkThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFF1F2F3),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFBBBBBB),
    onSecondary: Color(0xFFEAEAEA),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFF202020),
    onBackground: Color(0xFF505050),
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  );
}*/