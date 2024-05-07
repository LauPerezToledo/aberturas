class Item {
  static const PARAM_IDMENU = "idmenu";
  static const PARAM_DESCRIPCION = "descripcion";
  static const PARAM_PADRE = "padre";
  static const PARAM_RUTA = "ruta";
  static const PARAM_IDITEM = "iditem";
  static const PARAM_ORDEN = "orden";
  static const PARAM_ICONO = "icono";

  late int _idMenu;
  late String _descripcion;
  late int? _padre;
  late String _ruta;
  late int _idItem;
  late int _orden;
  late String _icono;

  Item() {
    _idMenu = 1;
    _descripcion = "materiales";
    _padre = null;
    _ruta = "/materiales";
    _orden = 0;
    _icono = "document_scanner";
  }

  int get idMenu => _idMenu;

  set idMenu(int value) {
    _idMenu = value;
  }

  String get descripcion => _descripcion;

  set descripcion(String value) {
    _descripcion = value;
  }

  int? get padre => _padre;

  set padre(int? value) {
    _padre = value;
  }

  String get ruta => _ruta;

  set ruta(String value) {
    _ruta = value;
  }

  int get idItem => _idItem;

  set idItem(int value) {
    _idItem = value;
  }

  int get orden => _orden;

  set orden(int value) {
    _orden = value;
  }

  String get icono => _icono;

  set icono(String value) {
    _icono = value;
  }
}

