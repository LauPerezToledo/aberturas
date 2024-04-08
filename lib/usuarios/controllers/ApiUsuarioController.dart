import 'package:http/http.dart' as http;
import '../../constants.dart';
import 'dart:convert';
import '../models/Usuario.dart';

class ApiUsuarioController {
  static final String API_GET = "view_usuario_logins";
  static final String API_LOGIN = "usuario/login";
  static final String USER = "user";
  static final String PASS = "pass";
  static ApiUsuarioController? _instance; // Variable estática para almacenar la instancia única

  // Constructor privado
  ApiUsuarioController._();

  // Método estático para obtener la instancia única
  static ApiUsuarioController getInstance() {
    _instance ??= ApiUsuarioController._(); // Inicializa la instancia solo si es null
    return _instance!;
  }

  Future<List<Usuario>> getAll() async {
    var url = Uri.parse(Constants.URL + API_GET);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as List<dynamic>;
      List<Usuario> usuarios = jsonData.map((json) => Usuario.fromJson(json)).toList();
      return usuarios;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<Usuario> login(Usuario usuario, String pass) async {
    var url = Uri.parse(Constants.URL + API_LOGIN);
    var body = {USER: usuario.usuario, PASS: pass};

    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData['success'] == true) {
        print("El usuario se ha logueado correctamente: " +  Usuario.fromJson(jsonData['usuario']).toString());
        return usuario;
      } else {
        throw Exception('Inicio de sesión fallido');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
