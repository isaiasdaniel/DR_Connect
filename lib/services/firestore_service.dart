// lib/services/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todos los posts
  Future<List<Post>> getPosts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('posts').get();
    return querySnapshot.docs
        .map((doc) => Post.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Agregar un nuevo post
  Future<void> addPost(Post post) async {
    await _firestore.collection('posts').add(post.toMap());
  }

  // Eliminar un post
  Future<void> deletePost(String postId) async {
    await _firestore.collection('posts').doc(postId).delete();
  }
}
