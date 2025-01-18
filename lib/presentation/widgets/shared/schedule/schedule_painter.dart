import 'package:flutter/material.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';
import 'package:gestor/presentation/widgets/shared/schedule/schedule_constants.dart';

class DivisionsInColorPallete {
  Color background;
  Color font;

  DivisionsInColorPallete({
    required this.background,
    required this.font,
  });
}

class SchedulePainter extends CustomPainter {
  final List<Map<String, dynamic>> schedule;
  final double width;
  final double height;

  SchedulePainter(
      {required this.schedule, required this.width, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final textHeight = (height / 5 - 10) / 3 - 5;

    final textStyleOutside = TextStyle(
        color: Colors.black, fontSize: textHeight, fontWeight: FontWeight.w600);

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    //días de la semana que abarquen aproximadamente 200 pixeles
    //horas que abarquen unos 20 pixeles

    final dayPositions = {
      "Lunes": textHeight + 10 + 0 * (height - 20) / 5,
      "Martes": textHeight + 10 + 1 * (height - 20) / 5,
      "Miercoles": textHeight + 10 + 2 * (height - 20) / 5,
      "Jueves": textHeight + 10 + 3 * (height - 20) / 5,
      "Viernes": textHeight + 10 + 4 * (height - 20) / 5,
    };

    // Impresión de los días de la semana

    for (int i = 0; i < daysOfWeek.length; i++) {
      textPainter.text = TextSpan(
        text: daysOfWeek[i],
        style: textStyleOutside,
      );
      textPainter.layout(minWidth: 0, maxWidth: 150);
      textPainter.paint(
          canvas,
          Offset(
              5,
              textHeight +
                  10 +
                  i * (height - (textHeight + 10)) / 5 +
                  (height / 5 - 10 - textHeight) / 2));
    }

    textPainter.layout(minWidth: 0, maxWidth: 150);
    textPainter.paint(
        canvas,
        Offset(
            5,
            textHeight +
                10 +
                4 * (height - (textHeight + 10)) / 5 +
                (height / 5 - 10 - textHeight) / 2));

    for (int i = 0; i < horariosClases.length; i++) {
      textPainter.text = TextSpan(
        text: horariosClases[i],
        style: textStyleOutside,
      );
      textPainter.layout(minWidth: 0, maxWidth: (width - 150) / 9);
      textPainter.paint(canvas, Offset(150 + i * (width - 150) / 9, 5));
    }
    //--------------------------------------------------------------------------------------------------------------------------------

    Map<String, int> usedSubjects = <String, int>{};
    int currentAdding = 0;
    for (var item in schedule) {
      if (usedSubjects.containsKey(item["UnitName"]) == false) {
        usedSubjects[item["UnitName"]] = currentAdding;
        currentAdding++;
      }

      final day = item["DayOfWeek"];
      final startTime = item["StartTime"];
      final endTime = item["EndTime"];

      final startX = 150 + (width - 150) / 9 * (startHours[startTime] ?? 0);
      final endX =
          150 + (width - 150) / 9 * ((startHours[startTime] ?? 0) + 1) - 5;
      final y = dayPositions[day] ?? 0.0;

      // Draw rectangle
      canvas.drawRect(
          Rect.fromLTRB(startX, y, endX, y + height / 5 - 10),
          Paint()
            ..color =
                colorPalletes[(usedSubjects[item["UnitName"]] ?? 7)].background
            ..style = PaintingStyle.fill);

      // Draw text
      textPainter.text = TextSpan(
        text:
            '${item["GroupCode"]} - ${item["UnitName"]} (Salón ${item["Classroom"]})\nHorario: $startTime - $endTime',
        style: TextStyle(
            color: colorPalletes[(usedSubjects[item["UnitName"]] ?? 7)].font,
            fontSize: textHeight),
      );
      textPainter.layout(minWidth: 0, maxWidth: endX - startX);
      textPainter.paint(canvas, Offset(startX + 5, y + 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
