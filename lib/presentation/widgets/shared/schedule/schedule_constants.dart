import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/shared/schedule/schedule_painter.dart';

const startHours = {
  "7:00": 0,
  "8:30": 1,
  "10:30": 2,
  "12:00": 3,
  "13:30": 4,
  "15:00": 5,
  "16:30": 6,
  "18:30": 7,
  "20:00": 8
};

const List<String> horariosClases = [
  "7:00 - 8:30",
  "8:30 - 10:00",
  "10:30 - 12:00",
  "12:00 - 13:30",
  "13:30 - 15:00",
  "15:00 - 16:30",
  "16:30 - 18:00",
  "18:30 - 20:00",
  "20:00 - 21:30",
];

final List<DivisionsInColorPallete> colorPalletes = [
  DivisionsInColorPallete(background: Color(0xFF1E1E24), font: Colors.white),
  DivisionsInColorPallete(background: Color(0xFF92140C), font: Colors.white),
  DivisionsInColorPallete(background: Color(0xFFAFD2E9), font: Colors.black),
  DivisionsInColorPallete(background: Color(0xFFFFCF99), font: Colors.black),
  DivisionsInColorPallete(background: Color(0xFF111D4A), font: Colors.white),
  DivisionsInColorPallete(background: Color(0xFF839788), font: Colors.white),
  DivisionsInColorPallete(background: Color(0xFF0081A7), font: Colors.white),
  DivisionsInColorPallete(background: Color(0xFFC589E8), font: Colors.black),
];

final List<String> daysOfWeek = [
  "Lunes",
  "Martes",
  "Miércoles",
  "Jueves",
  "Viernes"
];
