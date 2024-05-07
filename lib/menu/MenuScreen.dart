import 'package:flutter/material.dart';
import '../Constants.dart';
import '../usuarios/models/Sesion.dart';

import 'Item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.sesion}) ;
  final Sesion sesion;


// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aberturas de Aluminio + PBV',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Constants.primaryColor, // Establece el color de la AppBar como amarillo
          ),
          scaffoldBackgroundColor: Colors.white, // Establece el fondo blanco
        ),
        home:_MenuScreen(sesion: sesion)
    );

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _MenuScreen extends StatelessWidget{
  late Sesion sesion;
  _MenuScreen({required this.sesion});

  @override
  Widget build (BuildContext) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Aberturas de Aluminio + PVC'),
            leading: IconButton(
             icon: Icon(Icons.menu), // Icono de las tres barras
             onPressed: () {
             // Lógica para abrir el menú
             },
             ),
            actions: [
              IconButton(
                icon: Icon(Icons.person), // Icono de sesión
                onPressed: () {
                // Lógica para manejar la sesión
                },
    ),
    ],
        ),
        body: ListView.builder(
            itemCount: sesion.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(sesion.items[index].descripcion),
                trailing: Icon(sesion.items[index].icono as IconData?),
              );

            }
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notificacion',
            ),
          ],
        )
    );
  }
}
