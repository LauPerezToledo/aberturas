import 'package:aberturas/screens/UsuarioLoginScreen.dart';
import 'package:aberturas/usuarios/controllers/ApiUsuarioController.dart';
import 'package:aberturas/usuarios/models/Usuario.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const MyHomePage(title: 'Aberturas de Aluminio + PBV')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Usuario>> _fetchUsuarios() async {

    try {
      List<Usuario> usuarios = await ApiUsuarioController.getInstance()
          .getAll();
      print(usuarios[0].foto);
      return usuarios;
    } catch (error) {
      print(error);
      return [];
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: FutureBuilder<List<Usuario>>(
      future: _fetchUsuarios(),
      builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error al obtener los usuarios'),
          );
        } else {
        List<Usuario> usuarios = snapshot.data!;
        return GridView.count(
          padding: EdgeInsets.all(20.0), // Ajusta el espaciado general de los mosaicos
          crossAxisSpacing: 10.0, // Ajusta el espaciado horizontal entre los mosaicos
          mainAxisSpacing: 10.0, // Ajusta el espaciado vertical entre los mosaicos
          crossAxisCount: 3,
          children: usuarios.map((usuario) {
            return GestureDetector(
             onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800), // Duración de la animación
                  pageBuilder: (context, animation, secondaryAnimation) => UsuarioLoginScreen(usuario: usuario),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation, // Utiliza el valor de la animación para controlar la opacidad
                      child: child,
                    );
                  },
                ),
              );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Establece el radio del borde
                  side: BorderSide(color: Colors.grey), // Establece el color del borde
              ),
                color: Colors.white,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.network(
                        usuario.foto,
                        width: 120,
                        height: 120,),
                      SizedBox(height: 8.0),
                      Text(usuario.nombre),
                    ],
                  ),
                ),
              ),
          );
        }).toList(),
      );
    }
        },
  ),
  );
  }
  }