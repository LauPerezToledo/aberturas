import '../../menu/Item.dart';
import 'UsuarioLogueado.dart';

class Sesion {
  static const PARAM_TOKEN = "token";
  static const PARAM_SUCCESS = "success";
  static const PARAM_MENU = "menu";

  late UsuarioLogueado _objUsuarioLogueado;
  late String _token;
  late bool _success;
  late List<Item> _items;

  Sesion(this._token, this._success, this._items, this._objUsuarioLogueado);

  Sesion.fromJson(Map<String, dynamic> json)
      : _token = json[PARAM_TOKEN] ?? '',
        _success = json[PARAM_SUCCESS] ?? false,
        //_items = (json[PARAM_MENU] as List<dynamic>).map((itemJson) => Item.fromJson(itemJson)).toList(),
        _objUsuarioLogueado = UsuarioLogueado.fromJson(json['usuario']);

  String get token => _token;

  set token(String value) {
    _token = value;
  }



  UsuarioLogueado get objUsuarioLogueado => _objUsuarioLogueado;

  set objUsuarioLogueado(UsuarioLogueado value) {
    _objUsuarioLogueado = value;
  }

  List<Item> get items => _items;

  set items(List<Item> value) {
    _items = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }
}


