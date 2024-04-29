import 'package:aberturas/usuarios/models/Usuario.dart';

/*{
    "usuario": {
        "codigo": 1,
        "nick": "jp",
        "password": "jp",
        "activo": 1,
        "iniciales": "jd",
        "nivel": 1,
        "imagen": 7120,
        "mensajes": 1,
        "orden": 24,
        "imagenLogin": 7120,
        "Vendedor": 6,
        "firma": "<html class=\"no-js\">\r\n  <head>\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <title>Firma</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <meta name=\"description\" content=\"Aberturas de Aluminio S.A.\">\r\n    <meta name=\"keywords\" content=\"Aberturas de Aluminio, Firma\">\r\n    <meta name=\"author\" content=\"aberturas.com.ar\">\r\n    <!-- Facebook and Twitter integration -->\r\n    <meta property=\"og:title\" content=\"\">\r\n    <meta property=\"og:image\" content=\"\">\r\n    <meta property=\"og:url\" content=\"\">\r\n    <meta property=\"og:site_name\" content=\"\">\r\n    <meta property=\"og:description\" content=\"\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    \r\n  </head>\r\n  <body>\r\n    <map name=\"Map\">\r\n      <area shape=\"rect\" coords=\"24,118,63,150\" href=\"https://wa.me/5492995812040\"></area>\r\n      <area shape=\"rect\" coords=\"64,118,200,150\" href=\"tel: 92995812040\"></area>\r\n      <area shape=\"rect\" coords=\"390,118,570,150\" href=\"http://aberturas.com.ar/assets/img/qr.vcf\"></area>\r\n      <area shape=\"rect\" coords=\"25,225,250,255\" href=\"tel: 02994792216\"></area>\r\n      <area shape=\"rect\" coords=\"25,280,180,310\" href=\"http://aberturas.com.ar\"></area>\r\n      <area shape=\"rect\" coords=\"390,280,500,310\" href=\"https://goo.gl/maps/knUpTDemqo4xCmMc6\"></area>\r\n      <area shape=\"rect\" coords=\"505,280,534,310\" href=\"https://www.instagram.com/aberturasdealuminiosa\"></area>\r\n      <area shape=\"rect\" coords=\"540,280,570,310\" href=\"https://www.facebook.com/aberturasdealuminiosa\"></area>\r\n    </map>\r\n    <div align=\"center\" style=\"width: 600px\">\r\n      <table>\r\n        <tr>\r\n          <td width=\"600\">\r\n            <div style=\"width: 600px\">\r\n              <img src=\"http://aberturas.com.ar/assets/img/firma_ernesto.png\" usemap=\"#Map\" style=\"width: 100%\">\r\n              <!--Whatsapp-->\r\n              <!--Llamar-->\r\n              <!--Agendar-->\r\n              <!--Llamar-->\r\n              <!--Web-->\r\n              <!--Como Llegar-->\r\n              <!--Facebook-->\r\n              <!--Facebook-->\r\n              </div>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </div>\r\n  </body>\r\n</html>\r\n",
        "imagenPanel": 100,
        "estadisticas": 1,
        "email": "administrador@aberturas.com.ar",
        "authKey": "9ef48bd284efb4e17c04c60f131e7de834ca7369acf3a63d0545b2002d9d52afc08652d599ec7f5f747c74e80ef11d4c221717387cbb3d67c9782ba5d43bcecf6a9fb1603660c155f46bb959815b451888ed327fc5fc3b2905242dd20352a2578c219963",
        "accessToken": "96ace724f866afe10b80f0d49bc693d935e5468dd4a9b4cb25ccca3fd30d23a6ca158cdb96d2bf8b14ef7b7100198959252ba7003fd19121fae81188131bd5e27516a90abdb658ada6c68e850ce307519ce890fa1181e50e488bd059dc911fb6a9905eb1",
        "verification_code": null,
        "passwordWeb": "$2y$13$BXsoj28UVcng1xgqpkj8fOhXZatNwvNqVZN0QtR.7OvZwbA5pNrWq",
        "adjunto_foto": "uploads/foto_perfil/foto_default.jpg",
        "activate": 1,
        "role": 1,
        "foto_app": "https://5c50050f3e81.sn.mynetname.net/DocumentosAASA/usuarios_app/jds.png",
        "actualizacion": "2019-07-30",
        "telefono": "542984662605",
        "acceso_directo": null
    },
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6MX0.eyJzdWIiOjEsImlzcyI6ImFhc2FfY29tX3lpaSIsImF1ZCI6ImFhc2F5aWkuamVkcy5hciIsImlhdCI6MTcxMzUyNzg3OSwiZXhwIjoxNzEzNTU3ODc5LCJqdGkiOiI5MDYwNmZjZDNmMmY4N2QiLCJuaWNrIjoianAifQ.rcwE9CkMUk43PO6Fa_a_mDcdddhOjMpsHxOQ1-nyNhA",
    "success": true
}*/

class UsuarioLogueado extends Usuario {
  static const PARAM_ACTIVO = "activo";
  static const PARAM_INICIALES = "iniciales";
  static const PARAM_NIVEL = "nivel";
  static const PARAM_ORDEN = "orden";
  static const PARAM_IMAGENLOGIN = "imagenLogin";
  static const PARAM_IMAGENPANEL = "imagenPanel";
  static const PARAM_ESTADISTICAS = "estadisticas";
  static const PARAM_AUTHKEY = "authKey";
  static const PARAM_ACCESSTOKEN = "accessToken";
  static const PARAM_VERIFICATIONCODE = "verificationCode";
  static const PARAM_ROLE = "role";
  static const PARAM_ACTUALIZACION = "actualizacion";
  static const PARAM_ACCESODIRECTO = "acceso_directo";
  static const PARAM_TOKEN = "token";
  static const PARAM_SUCCESS = "success";

  late int _activo;
  late String _iniciales;
  late int _nivel;
  late int _orden;
  late int _imagenLogin;
  late int _imagenPanel;
  late int _estadisticas;
  late String _authKey;
  late String _accessToken;
  late String _verificationCode;
  late int _role;
  late String _actualizacion;
  late String _accesoDirecto;


  UsuarioLogueado.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    _activo = json[PARAM_ACTIVO] ?? 0;
    _iniciales = json[PARAM_INICIALES] ?? '';
    _nivel = json[PARAM_NIVEL] ?? 0;
    _orden = json[PARAM_ORDEN] ?? 0;
    _imagenLogin = json[PARAM_IMAGENLOGIN] ?? 0;
    _imagenPanel = json[PARAM_IMAGENPANEL] ?? 0;
    _estadisticas = json[PARAM_ESTADISTICAS] ?? 0;
    _authKey = json[PARAM_AUTHKEY] ?? '';
    _accessToken = json[PARAM_ACCESSTOKEN] ?? '';
    _verificationCode = json[PARAM_VERIFICATIONCODE] ?? '';
    _role = json[PARAM_ROLE] ?? 0;
    _actualizacion = json[PARAM_ACTUALIZACION] ?? '';
    _accesoDirecto = json[PARAM_ACCESODIRECTO] ?? '';

  }

  int get activo => _activo;
  set activo(int value) => _activo = value;

  String get iniciales => _iniciales;
  set iniciales(String value) => _iniciales = value;

  int get nivel => _nivel;
  set nivel(int value) => _nivel = value;

  int get orden => _orden;
  set orden(int value) => _orden = value;

  int get imagenLogin => _imagenLogin;
  set imagenLogin(int value) => _imagenLogin = value;

  int get imagenPanel => _imagenPanel;
  set imagenPanel(int value) => _imagenPanel = value;

  int get estadisticas => _estadisticas;
  set estadisticas(int value) => _estadisticas = value;

  String get authKey => _authKey;
  set authKey(String value) => _authKey = value;

  String get accessToken => _accessToken;
  set accessToken(String value) => _accessToken = value;

  String get verificationCode => _verificationCode;
  set verificationCode(String value) => _verificationCode = value;

  int get role => _role;
  set role(int value) => _role = value;

  String get actualizacion => _actualizacion;
  set actualizacion(String value) => _actualizacion = value;

  String get accesoDirecto => _accesoDirecto;
  set accesoDirecto(String value) => _accesoDirecto = value;

}