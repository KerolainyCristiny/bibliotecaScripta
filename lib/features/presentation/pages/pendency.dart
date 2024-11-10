import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/bottom_navigator.dart';

class PendencyScreen extends StatelessWidget {
  const PendencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Pendências'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícone de em construção (Martelo ou algo simbólico)
              Icon(
                Icons.build,
                color: Colors.orange,
                size: 100,
              ),
              const SizedBox(height: 20),
              
              // Texto de mensagem
              const Text(
                'Esta página está em construção!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              const Text(
                'Estamos trabalhando para trazer essa funcionalidade, espere a próxima atualização',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // Botão para voltar ou continuar na tela
              ElevatedButton(
                onPressed: () {
                  // Voltar para a tela anterior
                  Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(builder: (context) => const BottomNavigator()),
                       );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Voltar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
