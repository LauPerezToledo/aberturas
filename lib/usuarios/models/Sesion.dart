import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'UsuarioLogueado.dart';

class Sesion{
  late UsuarioLogueado _objUsuarioLogueado;
  late String _token;
  late bool _success;


  Sesion(this._token, this._success);

  factory Sesion.fromJson(Map<String, dynamic> json) {
    return Sesion(
      json['token'],
      json['success'],
    );
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  UsuarioLogueado get objUsuarioLogueado => _objUsuarioLogueado;

  set objUsuarioLogueado(UsuarioLogueado value) {
    _objUsuarioLogueado = value;
  }
}

