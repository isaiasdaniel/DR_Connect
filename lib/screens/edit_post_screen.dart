import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPostScreen extends StatefulWidget {
  final String postId;

  EditPostScreen({required this.postId});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPostData();
  }

  void _loadPostData() async {
    var post = await FirebaseFirestore.instance.collection('posts').doc(widget.postId).get();
    if (post.exists) {
      _titleController.text = post['title'];
      _contentController.text = post['content'];
      _imageController.text = post['image'];
    }
  }

  void _updatePost() {
    FirebaseFirestore.instance.collection('posts').doc(widget.postId).update({
      'title': _titleController.text,
      'content': _contentController.text,
      'image': _imageController.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Post actualizado!')));
      Navigator.pop(context); // Volver a la pantalla anterior
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al actualizar el post')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Contenido'),
              maxLines: 4,
            ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'URL de Imagen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updatePost,
              child: Text('Actualizar Post'),
            ),
          ],
        ),
      ),
    );
  }
}
