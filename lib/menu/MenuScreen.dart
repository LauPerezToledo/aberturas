import 'package:flutter/material.dart';
import '../usuarios/controllers/ApiUsuarioController.dart';
import '../usuarios/models/Sesion.dart';
import 'Item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.sesion});
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
          Item item = widget.sesion.items[index];
          //Item item = Item();
          return Padding(
            padding: EdgeInsets.only(top: 15, left: 17),
            child: Card(
              color: Color(0xFFF7F2FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Radio de 12px
              ),// Color de fondo de la tarjeta
              child: SizedBox(
                width: 360, // Ancho de la tarjeta
                height: 80, // Altura de la tarjeta
                child: Column(
                  mainAxisSize: MainAxisSize.max, // Ajustar el ancho al máximo
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero, // Eliminar el padding interior del ListTile
                      dense: true, // Establecer dense en true para que el ListTile ocupe toda la altura disponible
                      title: Container(
                        width: 248, // Ancho del contenedor del texto
                        height: 24, // Altura del contenedor del texto
                        margin: EdgeInsets.only(right: 4, top: 8, bottom: 8), // Margen derecho y vertical
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10), // Agregar un poco de espacio horizontal
                          child: Text(
                            item.descripcion,
                            style: TextStyle(
                              fontSize: 16, // Tamaño de fuente
                              fontWeight: FontWeight.bold, // Texto en negrita
                            ),
                          ),
                        ),
                      ),
                      trailing: Container(
                        width: 80, // Ancho del contenedor del icono
                        height: double.infinity, // Altura del contenedor del ícono igual a la altura de la tarjeta
                        color: Color(0xFFD9D9D9), // Color de fondo del icono
                        alignment: Alignment.center, // Alineación del icono
                        child: Icon(
                          _getIconData(item.icono),
                          size: 52, // Tamaño del ícono (ajustado para que el tamaño total sea de 39x39 px)
                          color: Color(0xFF79747E), // Color del icono
                        ),
                      ),
                      onTap: () {
                        // Lógica para manejar el tap en la tarjeta
                      },
                    ),
                  ],
                ),
              ),
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