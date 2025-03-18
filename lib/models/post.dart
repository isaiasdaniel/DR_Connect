// lib/models/post.dart

class Post {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  Post({required this.id, required this.title, required this.content, required this.date});

  // Convertir un documento de Firestore a un objeto Post
  factory Post.fromFirestore(Map<String, dynamic> firestoreDoc) {
    return Post(
      id: firestoreDoc['id'],
      title: firestoreDoc['título'],
      content: firestoreDoc['contenido'],
      date: firestoreDoc['fecha_publicacion'].toDate(),
    );
  }

  // Convertir un objeto Post a un mapa que se puede guardar en Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'título': title,
      'contenido': content,
      'fecha_publicacion': date,
    };
  }
}
