import 'package:flutter/material.dart';
import '../usuarios/models/Usuario.dart';
import 'Item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.usuario});
  final Usuario usuario;

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
        home: const _MenuScreen()
    );
  }
}


class _MenuScreen extends StatefulWidget{
  final List<Item> items = List.generate(8, (index) => "Item $index");
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build (BuildContext){
    return Scaffold(
      appBar: AppBar (
        title: Text('Aberturas de Aluminio + PVC')
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].nombre),
            );
          }
      )
    );
  }
}