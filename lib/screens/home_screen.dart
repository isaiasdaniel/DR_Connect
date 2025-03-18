<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart'; // Para usar Firestore
=======
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // Lista de imágenes para el carrusel
  List<Map<String, String>> items = [
    {'image': 'assets/images/banner1.jpg'},
    {'image': 'assets/images/banner2.jpg'},
    {'image': 'assets/images/banner3.jpg'},
  ];

  // Método para cambiar la selección de la barra de navegación
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

<<<<<<< HEAD
  // Método para obtener los posts de Firestore
  Stream<List<Map<String, dynamic>>> _getPosts() {
    return FirebaseFirestore.instance
        .collection('posts') // La colección en Firestore
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {
                  'title': doc['title'], // Asegúrate de que 'title' esté en los documentos
                  'image': doc['image'], // Asegúrate de que 'image' esté en los documentos
                })
            .toList());
  }

=======
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal Empresa'),
        backgroundColor: Colors.blue, // Personaliza el color de la barra superior
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Bienvenido a DR-Connect"),
              background: Image.asset('assets/images/banner.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Carrusel de imágenes
              CarouselSlider(
                options: CarouselOptions(height: 200.0, autoPlay: true),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(i['image']!, fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
<<<<<<< HEAD
              
              // Mostrar los posts de Firestore
              StreamBuilder<List<Map<String, dynamic>>>( 
                stream: _getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay posts disponibles.'));
                  }

                  // Lista de posts
                  var posts = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      var post = posts[index];
                      return ListTile(
                        title: Text(post['title']),
                        leading: Image.network(post['image']),
                      );
                    },
                  );
                },
              ),
=======
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
            ]),
          ),
        ],
      ),
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Empresas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contacto',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,  // Actualiza la selección de la barra de navegación
      ),
    );
  }
}
