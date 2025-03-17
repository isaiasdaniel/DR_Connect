import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Asegúrate de que el archivo login_screen.dart esté en la carpeta "screens"
import 'screens/home_screen.dart';   // Asegúrate de que el archivo home_screen.dart esté en la carpeta "screens"

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DR-Connect',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),  // Ruta de login
        '/inicio': (context) => HomeScreen(),  // Ruta de la pantalla de inicio de la empresa
      },
    );
  }
}
