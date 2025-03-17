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
