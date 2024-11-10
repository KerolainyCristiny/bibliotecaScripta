import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/pages/login.dart';  // Certifique-se de importar a tela de login ou qualquer outra tela para navegação

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3), // Cor azul claro
        title: const Text(
          'Olá, João!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ícone de seta para voltar
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção de informações do aluno
            InfoCard(
              title: 'Empréstimos Ativos',
              value: '5 livros',
            ),
            const SizedBox(height: 16),
            InfoCard(
              title: 'Histórico de Empréstimos',
              value: '20 livros',
            ),
            const SizedBox(height: 16),
            InfoCard(
              title: 'Total de Livros Emprestados',
              value: '25 livros',
            ),
            // Espaço entre as seções
            const SizedBox(height: 50),
            // Botão Sair e Rodapé com aviso de segurança/privacidade
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os elementos verticalmente no centro
              crossAxisAlignment: CrossAxisAlignment.center, // Alinha os elementos horizontalmente no centro
              children: [
                ElevatedButton(
                   onPressed: () {
                    // Função para logout, como exemplo
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false,  // Remove todas as rotas anteriores
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Cor do botão igual ao texto
                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 70), // Tamanho do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                    ),
                  ),
                  child: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 16), // Espaço entre o botão e o aviso
                const Text(
                  'Aviso: Seus dados estão seguros.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center, // Centraliza o texto
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para as informações do aluno
class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
