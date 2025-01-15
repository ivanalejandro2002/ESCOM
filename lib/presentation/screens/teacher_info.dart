import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/api_provider.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';
import 'package:path_provider/path_provider.dart';

class DivisionsInColorPallete {
  Color background;
  Color font;

  DivisionsInColorPallete({
    required this.background,
    required this.font,
  });
}

class TeacherInfo extends StatefulWidget {
  final String teacherId; // ID del profesor
  final String firstName; // Nombre
  final String academyName; // Academia
  final String curp; // CURP

  const TeacherInfo({
    super.key,
    required this.teacherId,
    required this.firstName,
    required this.academyName,
    required this.curp,
  });

  @override
  _TeacherInfoState createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {
  List<Map<String, dynamic>>? schedule; // Horario del profesor
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchSchedule(); // Cargar solo el horario
  }

  final GlobalKey _globalKey = GlobalKey();

  Future<void> _fetchSchedule() async {
    try {
      // Obtén el horario del profesor usando su ID
      final teacherSchedule =
          await ApiService.getScheduleByTeacherId(widget.teacherId);

      setState(() {
        schedule = teacherSchedule;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar el horario: $e';
        isLoading = false;
      });
    }
  }

  Future<void> _saveAsImage() async {
    try {
      // Obtiene el render del widget
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image =
          await boundary.toImage(pixelRatio: 3.0); // Mejor resolución

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      // Obtén el directorio para guardar la imagen
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/schedule_large.png';

      print(":D");
      print(filePath);

      // Guarda el archivo como PNG
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      // Muestra una confirmación
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Horario guardado en: $filePath')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la imagen')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size dimentions = MediaQuery.sizeOf(context);

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del Profesor'),
        ),
        body: Center(
          child: Text(
            errorMessage!,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:
                    Image.network("widget.myImage", height: 200, width: 280)),
          ),
          Text(
            widget.firstName,
            style: TextStyle(
                color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text('Academia (Sala): ${widget.academyName}'),
          Text('CURP: ${widget.curp}'),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Horario de clases:'),
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: _saveAsImage,
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RepaintBoundary(
              key: _globalKey,
              child: CustomPaint(
                size: Size(2400, dimentions.height - 540),
                painter: SchedulePainter(
                    schedule: schedule ?? [],
                    width: 2400,
                    height: dimentions.height - 540),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}

class SchedulePainter extends CustomPainter {
  final List<Map<String, dynamic>> schedule;
  final double width;
  final double height;

  SchedulePainter(
      {required this.schedule, required this.width, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final textHeight = (height / 5 - 10) / 3 - 5;
    final textStyle = TextStyle(color: Colors.white, fontSize: textHeight);
    final textStyleOutside = TextStyle(
        color: Colors.black, fontSize: textHeight, fontWeight: FontWeight.w600);

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Map day of the week to a vertical position

    //días de la semana que abarquen aproximadamente 200 pixeles
    //horas que abarquen unos 20 pixeles

    final dayPositions = {
      "Lunes": textHeight + 10 + 0 * (height - 20) / 5,
      "Martes": textHeight + 10 + 1 * (height - 20) / 5,
      "Miercoles": textHeight + 10 + 2 * (height - 20) / 5,
      "Jueves": textHeight + 10 + 3 * (height - 20) / 5,
      "Viernes": textHeight + 10 + 4 * (height - 20) / 5,
    };

    final startHours = {
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

    final List<String> horariosClases = [
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
      DivisionsInColorPallete(
          background: Color(0xFF1E1E24), font: Colors.white),
      DivisionsInColorPallete(
          background: Color(0xFF92140C), font: Colors.white),
      DivisionsInColorPallete(
          background: Color(0xFFAFD2E9), font: Colors.black),
      DivisionsInColorPallete(
          background: Color(0xFFFFCF99), font: Colors.black),
      DivisionsInColorPallete(
          background: Color(0xFF111D4A), font: Colors.white),
      DivisionsInColorPallete(
          background: Color(0xFF839788), font: Colors.white),
      DivisionsInColorPallete(
          background: Color(0xFF0081A7), font: Colors.white),
      DivisionsInColorPallete(
          background: Color(0xFFC589E8), font: Colors.black),
    ];

    // Impresión de los días de la semana
    textPainter.text = TextSpan(
      text: 'Lunes',
      style: textStyleOutside,
    );
    textPainter.layout(minWidth: 0, maxWidth: 150);
    textPainter.paint(
        canvas,
        Offset(
            5,
            textHeight +
                10 +
                0 * (height - (textHeight + 10)) / 5 +
                (height / 5 - 10 - textHeight) / 2));

    textPainter.text = TextSpan(
      text: 'Martes',
      style: textStyleOutside,
    );
    textPainter.layout(minWidth: 0, maxWidth: 150);
    textPainter.paint(
        canvas,
        Offset(
            5,
            textHeight +
                10 +
                (height - (textHeight + 10)) / 5 +
                (height / 5 - 10 - textHeight) / 2));

    textPainter.text = TextSpan(
      text: 'Miercoles',
      style: textStyleOutside,
    );
    textPainter.layout(minWidth: 0, maxWidth: 150);
    textPainter.paint(
        canvas,
        Offset(
            5,
            textHeight +
                10 +
                2 * (height - (textHeight + 10)) / 5 +
                (height / 5 - 10 - textHeight) / 2));

    textPainter.text = TextSpan(
      text: 'Jueves',
      style: textStyleOutside,
    );
    textPainter.layout(minWidth: 0, maxWidth: 150);
    textPainter.paint(
        canvas,
        Offset(
            5,
            textHeight +
                10 +
                3 * (height - (textHeight + 10)) / 5 +
                (height / 5 - 10 - textHeight) / 2));

    textPainter.text = TextSpan(
      text: 'Viernes',
      style: textStyleOutside,
    );
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

    Map<String, int> usedSubjects = new Map<String, int>();
    int currentAdding = 0;
    for (var item in schedule) {
      if (usedSubjects.containsKey(item["UnitName"]) == false) {
        usedSubjects[item["UnitName"]] = currentAdding;
        currentAdding++;
      }

      final day = item["DayOfWeek"];
      final startTime = item["StartTime"];
      final endTime = item["EndTime"];
      /*final startTime = TimeOfDay(
          hour: int.parse(item["StartTime"].split(":")[0]),
          minute: int.parse(item["StartTime"].split(":")[1]));
      final endTime = TimeOfDay(
          hour: int.parse(item["EndTime"].split(":")[0]),
          minute: int.parse(item["EndTime"].split(":")[1]));
      */
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
            '${item["GroupCode"]} - ${item["UnitName"]} (Salón ${item["Classroom"]})\nHorario: ${startTime} - ${endTime}',
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
