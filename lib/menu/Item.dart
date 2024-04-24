class Item{
  late String _nombre;
  late String _imagen;

  Item(){
    _nombre = "";
    _imagen = "";
  }

  String toString() {
    return "Nombre: $_nombre";
  }

  set nombre(String value) {
    _nombre = value;
  }

  String get nombre => _nombre;

  set imagen(String value) {
    _imagen = value;
  }

  String get imagen => _imagen;
}