class Usuario{
  static const PARAM_IDUSUARIO = "codigo";
  static const PARAM_USUARIO = "nick";
  static const PARAM_FOTO = "foto_app";
  static const PARAM_NOMBRE = "nombre";
  static const PARAM_APELLIDO = "apellido";
  static const PARAM_VENDEDOR = "vendedor";
  static const PARAM_EMAIL = "administrador@aberturas.com.ar";
  static const PARAM_TELEFONO = "telefono";
  static const PARAM_CAMBIOCONTRASENIA = "cambioContrasenia";

  late int _idusuario;
  late String _usuario;
  late String _foto;
  late String _nombre;
  late String _apellido;
  late int _vendedor;
  late String _email;
  late String _telefono;
  late bool _cambioContrasenia;

  Usuario(){
    _idusuario=0;
    _usuario="";
    _foto="";
    _nombre="";
    _apellido="";
    _vendedor=0;
    _email="";
    _telefono="";
    _cambioContrasenia=false;
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : _idusuario = json[PARAM_IDUSUARIO] ?? 0,
        _usuario = json[PARAM_USUARIO] ?? '',
        _foto = json[PARAM_FOTO] ?? '',
        _nombre = json[PARAM_NOMBRE] ?? '',
        _apellido = json[PARAM_APELLIDO] ?? '',
        _vendedor = json[PARAM_VENDEDOR] ?? 0,
        _email = json[PARAM_EMAIL] ?? '',
        _telefono = json[PARAM_TELEFONO] ?? '',
        _cambioContrasenia = json[PARAM_CAMBIOCONTRASENIA] ?? false;

  @override
  String toString() {
    return "ID: $_idusuario | Usuario: $_usuario | Nombre: $_nombre | Apellido: $_apellido ";
  }

  set idusuario(int value) {
    _idusuario = value;
  }

  int get idusuario => _idusuario;

  set usuario(String value) {
    _usuario = value;
  }

  String get usuario => _usuario;

  set foto(String value) {
    _foto = value;
  }

  String get foto => _foto;

  set nombre(String value) {
    _nombre = value;
  }

  String get nombre => _nombre;

  set apellido(String value) {
    _apellido = value;
  }

  String get apellido => _apellido;

  set vendedor(int value){
    _vendedor = value;
  }

  int get vendedor => _vendedor;

  set email (String value){
    _email = value;
  }

  String get email => _email;

  set telefono(String value) {
    _telefono = value;
  }

  String get telefono => _telefono;

  bool get cambioContrasenia => _cambioContrasenia;

  set cambioContrasenia(bool value) {
    _cambioContrasenia = value;
  }
}

