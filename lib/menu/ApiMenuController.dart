import 'dart:convert';
import 'package:http/http.dart' as http;

import '../usuarios/models/Sesion.dart';

class ApiMenuController{
  static const String baseUrl = 'https://aasayii.jeds.ar/web';

  // Método para obtener el menú
  static Future<List<Map<String, dynamic>>> getMenu(Sesion sesion) async {
    final url = Uri.parse('$baseUrl/usuario/login?user=${sesion.objUsuarioLogueado.usuario}');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Procesar la respuesta JSON
        final jsonResponse = json.decode(response.body);
        final menu = jsonResponse['item'] as List<dynamic>;
        return menu.cast<Map<String, dynamic>>();
      } else {
        // Manejar errores si la respuesta no es exitosa
        throw Exception('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar errores de conexión
      throw Exception('Error de conexión: $e');
    }
  }
}