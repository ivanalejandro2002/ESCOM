import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // Guardar datos de sesión
  Future<void> saveSession(String token, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token); // Guardar token
    await prefs.setString('userId', userId); // Guardar userId
  }

  // Recuperar datos de sesión
  Future<Map<String, String?>> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userId = prefs.getString('userId');
    return {
      'token': token,
      'userId': userId,
    };
  }

  // Eliminar sesión
  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Elimina todos los datos
  }
}
