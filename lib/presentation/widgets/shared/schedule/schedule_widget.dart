import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gestor/domain/testconstants/test_schedule.dart';
import 'package:gestor/presentation/widgets/shared/schedule/schedule_painter.dart';

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
  List<Map<String, dynamic>>? schedule;
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
      /*final teacherSchedule =
          await ApiService.getScheduleByTeacherId(widget.teacherId);*/

      setState(() {
        schedule = testSchedule;
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
    final double blockWidth = dimentions.width/3;
    final double textStart = (blockWidth*2)/3;

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
                size: Size((9*blockWidth + textStart), dimentions.height - 540),
                painter: SchedulePainter(
                    schedule: schedule ?? [],
                    width: (9*blockWidth + textStart),
                    blockWidth: blockWidth,
                    textstartSpace: textStart,
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
