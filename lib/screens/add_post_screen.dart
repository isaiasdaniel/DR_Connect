// lib/screens/add_post_screen.dart

import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/firestore_service.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> addPost() async {
    Post post = Post(
      id: DateTime.now().toString(),  // Asignamos un ID único con la fecha actual
      title: _titleController.text,
      content: _contentController.text,
      date: DateTime.now(),
    );

    await _firestoreService.addPost(post);
    Navigator.pop(context); // Volver a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Añadir Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Contenido'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addPost,
              child: Text('Añadir Post'),
            ),
          ],
        ),
      ),
    );
  }
}
