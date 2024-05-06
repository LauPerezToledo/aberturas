import 'package:flutter/material.dart';
import '../Constants.dart';
import '../usuarios/models/Sesion.dart';
import 'Item.dart';
import 'ApiMenuController.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.sesion}) ;
  final Sesion sesion;


  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    // Llama al método para obtener el menú al iniciar la pantalla
    getMenu();
  }

  Future<void> getMenu() async {
    try {
      // Llama al método getMenu de tu clase controladora y pasa el token de sesión
      final menuItems = await ApiMenuController.getMenu(widget.sesion);
      setState(() {
        items = menuItems.cast<Item>();
      });
    } catch (e) {
      // Maneja los errores si ocurre algún problema al obtener el menú
      print('Error al obtener el menú: $e');
    }
  }

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
        home:_MenuScreen(sesion: widget.sesion)
    );

  }
}

class _MenuScreen extends StatelessWidget{
  final List<Item> items = [];
  late Sesion sesion;
  _MenuScreen({required this.sesion});

  @override
  Widget build (BuildContext) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Aberturas de Aluminio + PVC')
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].descripcion),
                trailing: Icon(items[index].icono as IconData?),
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
