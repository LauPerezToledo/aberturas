import 'package:flutter/material.dart';
import '../usuarios/models/Sesion.dart';
import '../usuarios/models/Usuario.dart';
import 'Item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.sesion});
  final Sesion sesion;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aberturas de Aluminio + PBV',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.amber, // Establece el color de la AppBar como amarillo
          ),
          scaffoldBackgroundColor: Colors.white, // Establece el fondo blanco
        ),
        home:_MenuScreen(sesion: sesion)
    );
  }
}


class _MenuScreen extends StatelessWidget{
  final List<Item> items = [];
  late Sesion sesion;
  _MenuScreen({required this.sesion});

  @override
  Widget build (BuildContext){
    return Scaffold(
      appBar: AppBar (
        title: Text('Aberturas de Aluminio + PVC')
      ),
      /*body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].nombre),
            );
          }
      )*/
    body: Text('token: ' + sesion.token));
  }
}