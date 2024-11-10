import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/pages/UnderConstructionScreen.dart';
//import 'package:flutter_app/features/presentation/pages/home.dart';
import 'package:flutter_app/shared/components/bottom_navigator.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;  // Variável para controlar o estado do checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Cor de fundo da tela
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Cor do fundo do bloco
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(70),
                ), // Bordas arredondadas apenas na parte superior
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Sombra leve
                    blurRadius: 10,
                    offset: const Offset(0, -2), // Sombra para cima
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 20), // esquerda - topo - direita - baixo
              height: MediaQuery.of(context).size.height * 0.77, // parte branca ocupa 77% da altura da tela
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Alinha os widgets para cima
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35, // Tamanho do texto ajustado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true, // Oculta o texto da senha
                  ),
                  const SizedBox(height: 10),

      
                  // Seção do checkbox
                  Padding(
                    padding: const EdgeInsets.only(left: 0), // Ajuste o padding para zero ou valor desejado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,  // Alinha à esquerda
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // Adiciona borda arredondada
                          ),
                          ),
                    // Tornar o texto clicável
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isChecked = !_isChecked;  // Alterna o valor do checkbox
                            });
                          },
                          child: const Text(
                            'Lembrar-me',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        //const Text('Lembrar-me'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      // Navegação para outra tela de layout
                       Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(builder: (context) => const BottomNavigator()),
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Cor do botão igual ao texto
                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 70),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18), // Tamanho do texto do botão
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Link de "Esqueceu a senha?"
                  TextButton(
                    onPressed: () {
                      // Navegação para a tela de recuperação de senha
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UnderConstructionScreen() ),
                      );
                    },
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.blue, // Cor do texto do link
                        fontSize: 14, // Tamanho da fonte
                        decoration: TextDecoration.underline, // Deixa o texto sublinhado
                      ),
                    ),
                  ),
                ], // final parte branca
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.85, // Ajusta a posição do ícone de trás
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha no centro
              children: [
                // Ícone
                // Icon(
                //   Icons.library_books,  // Ícone de livros da biblioteca do Flutter
                //   color: Colors.white,  // Cor do ícone em branco
                //   size: 70,  // Tamanho do ícone
                // ),
                Image.asset(
                  'assets/images/logo_scripta.png', 
                  width: 70, 
                  height: 70, 
                  fit: BoxFit.contain, // Mantém a proporção da imagem
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
