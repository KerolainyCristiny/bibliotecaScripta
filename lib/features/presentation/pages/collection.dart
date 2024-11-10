import 'package:flutter/material.dart';

// class reascunho - a list vai ser dinamica ou consumida de uma api

class CollectionScreen extends StatelessWidget {
  CollectionScreen({super.key});

  // Lista de livros fictícia
  final List<Book> books = [
    Book(title: "Flutter para Iniciantes", author: "John Doe", imageUrl: 'assets/images/logo_scripta.png'),
    Book(title: "Dart Programming", author: "Jane Smith", imageUrl: 'assets/images/logo_scripta.png'),
    Book(title: "Desenvolvimento Mobile", author: "Lucas Almeida", imageUrl: 'assets/images/logo_scripta.png'),
    Book(title: "Arquitetura de Software", author: "Ana Paula", imageUrl: 'assets/images/logo_scripta.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3), // Cor azul claro
        title: const Text(
          'Coleção de Livros',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return BookListTile(book: book);
          },
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String imageUrl;

  Book({required this.title, required this.author, required this.imageUrl});
}

class BookListTile extends StatelessWidget {
  final Book book;

  const BookListTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(book.imageUrl),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          book.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          book.author,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {
          // Ação ao clicar no livro, pode ser redirecionar para uma tela de detalhes
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Redirecionando para os detalhes do livro')),
          );
        },
      ),
    );
  }
}
