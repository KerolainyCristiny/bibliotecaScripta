import 'package:flutter/material.dart';
import 'package:flutter_app/features/presentation/pages/home.dart';
import 'package:flutter_app/features/presentation/pages/search.dart';
import 'package:flutter_app/features/presentation/pages/collection.dart';
import 'package:flutter_app/features/presentation/pages/pendency.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    CollectionScreen(), // por nn ser uma lista dinamica nao pode usar o const
    const PendencyScreen()

    // Outras páginas podem ser adicionadas aqui
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Página selecionada
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _pages[_selectedIndex],
          ),
          // Bottom Navigation Bar flutuante
          Positioned(
            left: 15,
            right: 15,
            bottom: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30), // Borda arredondada
              child: Container(
                child: BottomNavigationBar(
                  backgroundColor: Colors.blue, // Cor de fundo do BottomNavigationBar
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.white), // Ícone de Home
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search, color: Colors.white), // Ícone de Pesquisa
                      label: 'Pesquisa',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book, color: Colors.white), // Ícone de Acervo (livro)
                      label: 'Acervo',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.warning, color: Colors.white), // Ícone de Pendências (aviso)
                      label: 'Pendências',
                    ),
                  ],
                  currentIndex: _selectedIndex, // Índice da página selecionada
                  selectedItemColor: Colors.white, // Cor do ícone selecionado
                  unselectedItemColor: Color.fromARGB(170, 255, 255, 255), // Cor dos ícones não selecionados
                  showUnselectedLabels: true, // Mostrar rótulos dos ícones não selecionados
                  onTap: _onItemTapped, // Função de troca de página ao clicar no item
                  type: BottomNavigationBarType.fixed, // Tipo do BottomNavigationBar
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

