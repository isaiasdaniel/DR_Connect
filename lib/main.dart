import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart'; // Pantalla principal
import 'screens/post_list_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  // Assegura que o Firebase será inicializado
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

=======
import 'screens/login_screen.dart';  // Asegúrate de que el archivo login_screen.dart esté en la carpeta "screens"
import 'screens/home_screen.dart';   // Asegúrate de que el archivo home_screen.dart esté en la carpeta "screens"

void main() {
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'App Firebase Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    // Exemplo de log de um evento no Firebase Analytics
    analytics.logEvent(
      name: 'page_view',
      parameters: <String, dynamic>{
        'page_title': 'Home',
        'page_location': 'HomeScreen',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Firebase Analytics'),
      ),
      body: Center(
        child: Text('Bem-vindo ao Firebase Analytics!'),
      ),
    );
=======
      title: 'DR-Connect',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),  // Ruta de login
        '/inicio': (context) => HomeScreen(),  // Ruta de la pantalla de inicio de la empresa
      },
    );
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
  }
}
