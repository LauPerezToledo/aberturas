import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../menu/MenuScreen.dart';
import 'controllers/ApiUsuarioController.dart';
import 'models/Usuario.dart';

import 'package:device_info_plus/device_info_plus.dart';

class UsuarioLoginScreen extends StatefulWidget {
  final Usuario usuario;

  UsuarioLoginScreen({required this.usuario});

  @override
  _UsuarioLoginScreenState createState() =>
      _UsuarioLoginScreenState(usuario: usuario);
}

class _UsuarioLoginScreenState extends State<UsuarioLoginScreen> {
  final Usuario usuario;
  final TextEditingController contrasenaController = TextEditingController();
  final FocusNode contrasenaFocusNode = FocusNode();
  bool _showPassword = false;

  _UsuarioLoginScreenState({required this.usuario});


  @override
  void initState() {
    super.initState();
    // Solicitar el foco para el campo de texto de la contraseña al cargar la pantalla
    contrasenaFocusNode.requestFocus();
  }

  // Método para manejar el inicio de sesión
  void _iniciarSesion(BuildContext context, Usuario usuario,
      String password) async {
    try {
      // Crear una instancia del controlador
      var apiController = ApiUsuarioController.getInstance();

      // Llamar al método de inicio de sesión
      var sesion = await apiController.login(usuario, password);

      // Iniciar sesión exitosa, hacer algo con el usuario logueado
      print("Inicio de sesión exitoso: $sesion");
      //evaluar si sesion.success = true
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuScreen(sesion:sesion)),
      );
    } catch (e) {
      // Error al iniciar sesión, manejar el error
      print("Error al iniciar sesión: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error en el acceso'),
            content: Text('Contraseña incorrecta'),
            actions: [
              TextButton(
                onPressed: () {
                  // Reiniciar el campo de texto de la contraseña
                  contrasenaController.clear();
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  /*Future<String> obtenerIdTelefono() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId; // ID del teléfono Android
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // ID del teléfono iOS
    }
    return ''; // Si el dispositivo no es Android ni iOS
   */


    @override
    Widget build(BuildContext context) {
      return Theme(
          data: Theme.of(context), // Utiliza el tema global de la aplicación
          child: Scaffold(
            appBar: AppBar(
              title: Text(usuario.usuario),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        usuario.foto,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: contrasenaController,
                          focusNode: contrasenaFocusNode,
                          // Asociar el controlador al campo de texto
                          obscureText: !_showPassword,
                          // Para ocultar la contraseña
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ingrese su contraseña',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: Icon(_showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para procesar el ingreso de contraseña
                            _iniciarSesion(
                                context, usuario, contrasenaController.text);
                          },
                          child: Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 18, color: Colors
                                .black87),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              // Establece un borde redondeado
                              side: BorderSide(
                                  color: Colors
                                      .grey), // Establece un borde gris
                            ),
                            backgroundColor: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ));
    }
  }
