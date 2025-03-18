import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart'; // Pantalla principal
import 'screens/post_list_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  // Assegura que o Firebase será inicializado
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  }
}
