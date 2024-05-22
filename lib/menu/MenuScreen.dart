import 'package:flutter/material.dart';
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
          return Padding(
            padding: EdgeInsets.only(top: 15, left: 17),
            child: Card(
              color: Color(0xFFF7F2FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Radio de 12px
              ),
              child: SizedBox(
                width: 360, // Ancho de la tarjeta
                height: 80, // Altura de la tarjeta
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start, // Alineación vertical al inicio
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.centerLeft, // Alineación horizontal a la izquierda y vertical al centro
                        child: Text(
                          item.descripcion,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 80, // Ancho del contenedor del ícono
                        height: 80, // Ajustar la altura del contenedor del ícono
                        color: Color(0xFFD9D9D9),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            // Imagen cargada desde la red
                            Image.network(
                              item.icono,
                              color: Color(0xFF79747E),
                              width: 80,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Lógica para manejar el tap en la tarjeta
                  },
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
}