import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/services/api_service.dart';

class UserProvider extends ChangeNotifier {
  int colorPalete = 0;
  late GlobalUser globalUserData;

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
