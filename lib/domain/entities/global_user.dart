import 'package:gestor/domain/entities/teachers.dart';

class GlobalUser {
  String nombre;
  String imageUrl;
  String boleta;
  String curp;
  List<AsignedTeacher> subjects;

  GlobalUser({
    required this.nombre,
    required this.imageUrl,
    required this.boleta,
    required this.curp,
    required this.subjects
  });
}