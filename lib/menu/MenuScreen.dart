import 'package:flutter/material.dart';
import '../usuarios/models/Sesion.dart';
import 'Item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, required this.sesion}) : super(key: key);
  final Sesion sesion;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
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
          itemCount: widget.sesion.items.length,
          itemBuilder: (context, index) {
            Item item = Item();
            return Card(
              child: ListTile(
                title: Text(item.descripcion),
                trailing: Icon(_getIconData(item.icono)),
                onTap: () {
                  // Lógica para manejar el tap en la tarjeta
                },
              ),
            );
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificación',
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'document_scanner':
        return Icons.document_scanner;
      case 'access_alarm':
        return Icons.access_alarm;
    // Agrega más casos según sea necesario para mapear los nombres de los iconos a los iconos de Flutter
      default:
        return Icons.error; // o cualquier otro icono predeterminado para manejar el caso de un nombre de icono desconocido
    }
}
}
