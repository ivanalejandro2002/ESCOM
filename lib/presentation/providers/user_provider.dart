import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/api_provider.dart';

class UserProvider extends ChangeNotifier {
  int colorPalete = 0;

  GlobalUser globalUserData = GlobalUser(
      nombre: 'Pepito',
      boleta: '1234567890',
      curp: 'XD',
      imageUrl:
          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
      subjects: [
        AssignedTeacher(
            teacherID: '1',
            firstName: 'Maestro Bot',
            lastName: 'Profesor',
            curp: '55123456789',
            academyName: 'Electónica',
            group: '5CM1',
            subject: 'Procesamiento Digital de Señales'),
        AssignedTeacher(
            teacherID: '2',
            firstName: 'Maestro 2',
            lastName: 'Profesor chafa',
            curp: '55123456789',
            academyName: 'Mantenido',
            group: 'XXX3',
            subject: 'Mendigar'),
        AssignedTeacher(
            teacherID: '3',
            firstName: 'Pepe',
            lastName: 'Arriba',
            curp: '55123456789',
            academyName: 'Abajo',
            group: '4AM2',
            subject: 'No se sabe'),
        AssignedTeacher(
            teacherID: '4',
            firstName: 'Otro maestro más',
            lastName: 'maistro',
            curp: '55123456789',
            academyName: 'Sonidero',
            group: '6CM7',
            subject: 'Sistemas en Chip'),
        AssignedTeacher(
            teacherID: '5',
            firstName: 'Maestro Bot',
            lastName: 'Profesor',
            curp: '55123456789',
            academyName: 'Electónica',
            group: '5CM1',
            subject: 'Procesamiento Digital de Señales'),
        AssignedTeacher(
            teacherID: '6',
            firstName: 'Maestro Bot',
            lastName: 'Profesor',
            curp: '55123456789',
            academyName: 'Electónica',
            group: '5CM1',
            subject: 'Procesamiento Digital de Señales'),
        AssignedTeacher(
            teacherID: '7',
            firstName: 'Maestro Bot',
            lastName: 'Profesor',
            curp: '55123456789',
            academyName: 'Electónica',
            group: '5CM1',
            subject: 'Procesamiento Digital de Señales'),
      ]);

  Future<void> fetchTeachers() async {
    try {
      final teachers = await ApiService.getTeachers();
      globalUserData = globalUserData.copyWith(subjects: teachers);
      notifyListeners(); // Notifica a los widgets para que se reconstruyan
    } catch (e) {
      throw Exception('Error al obtener maestros: $e');
    }
  }

  Future<void> addPhoto(String dir) async {
    globalUserData.imageUrl = dir;
    notifyListeners();
  }

  //Sirve para cambiar la paleta de colores
  Future<void> changePallete(int newPallete) async {
    colorPalete = newPallete;
    notifyListeners();
  }

  //Este sirve para poder obtener un nuevo usuario de la base de datos
  //Se llama una vez esté asegurado que el dato existe.
  Future<void> newLogin(GlobalUser newData) async {
    globalUserData = newData;
    notifyListeners();
  }
}
