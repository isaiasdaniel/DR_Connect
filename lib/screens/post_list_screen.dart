import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edit_post_screen.dart'; // Esta será tu pantalla de edición

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Posts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No hay posts disponibles"));
          }

          // Lista de Posts
          var posts = snapshot.data!.docs;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index];
              return ListTile(
                title: Text(post['title']),
                subtitle: Text(post['content']),
                leading: Image.network(post['image'], width: 50, height: 50),
                onTap: () {
                  // Aquí se va a la pantalla de edición con el post seleccionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPostScreen(postId: post.id),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    // Eliminando el post
                    await FirebaseFirestore.instance.collection('posts').doc(post.id).delete();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Post eliminado')));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
