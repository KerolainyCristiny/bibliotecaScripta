import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/pages/user.dart';
//import 'package:flutter_app/shared/components/bottom_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            // Logo no início da AppBar
            Image.asset(
              'assets/images/logo_scripta.png', // Caminho logo
              height: 25, // Tamanho da logo
            ),
          ],
        ),
        actions: [
          // Ícone de notificação
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white), // Ícone de notificação
            onPressed: () {
              // Ação ao pressionar o ícone de notificação
              print('Notificação pressionada!');
            },
          ),
          // Ícone de perfil
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white), // Ícone de perfil
            onPressed: () {
              // Navega para a tela UserScreen quando o ícone de perfil for pressionado
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // Seção de "Empréstimos de Livros"
            
            const Text( // colocar o status do emprestimo ( ativo ou em atraso)
              'Olá Estudante!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text( 
              'Acompanhe seus empréstimos por aqui.',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 115, 114, 114)),
            ),
            const SizedBox(height: 35),

            // Lista de livros emprestados (como exemplo)
            Expanded(
              child: ListView.builder(
                itemCount: 5, // QUANT livros
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        Icons.book, 
                        color: Colors.blue,
                        size: 40,
                      ),
                      title: Text('Livro ${index + 1}'),
                      subtitle: Text('Empréstimo realizado em: 01/01/2024'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Ação quando o usuário clicar no livro
                        // rredirecionar para uma tela com mais detalhes sobre o livro
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

