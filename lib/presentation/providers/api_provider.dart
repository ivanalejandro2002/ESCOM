import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/session_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://192.168.0.10:3000';

  static Future<bool> login(String boleta, String curp) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'student_id': boleta, 'student_curp': curp}),
      );

      if (response.statusCode == 200) {
        // Decodificar la respuesta y mapearla a un objeto GlobalUser
        final data = json.decode(response.body);
        if (data["existence"][0]["userExists"] == 1) {
          return true;
        } else {
          return false;
        }
      } else {
        throw Exception('Credenciales incorrectas');
      }
    } catch (e) {
      print(e);
      throw Exception('Error en la solicitud: $e');
    }
  }

  static Future<List<dynamic>> getTeachers() async {
    final session = SessionManager();
    var obj = await session.getSession();
    try {
      final url = Uri.parse('$baseUrl/teachers/${obj['userId']}');
      final response = await http.get(url);
      print("Código de estado: ${response.statusCode}");
      print("Cuerpo de la respuesta: ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Error al obtener maestros: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error en la solictud ${e}');
    }
  }
}
