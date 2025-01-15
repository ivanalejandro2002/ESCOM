import 'package:gestor/domain/entities/teachers.dart';

class GlobalUser {
  String nombre;
  String imageUrl;
  String boleta;
  String curp;
  List<AssignedTeacher> subjects;

  GlobalUser(
      {required this.nombre,
      required this.imageUrl,
      required this.boleta,
      required this.curp,
      required this.subjects});

  GlobalUser copyWith({
    String? nombre,
    String? boleta,
    String? curp,
    String? imageUrl,
    List<AssignedTeacher>? subjects,
  }) {
    return GlobalUser(
      nombre: nombre ?? this.nombre,
      boleta: boleta ?? this.boleta,
      curp: curp ?? this.curp,
      imageUrl: imageUrl ?? this.imageUrl,
      subjects: subjects ?? this.subjects,
    );
  }
}
