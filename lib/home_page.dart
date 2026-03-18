import 'package:flutter/material.dart';
import 'package:flutter_instagram/feed.dart';
import 'package:flutter_instagram/perfil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      const Feed(),
      const Center(child: Text('Tela Play')),
      const Center(child: Text('Tela Add')),
      const Center(child: Text('Tela Procurar')),
      const Perfil(),
    ];

    return Scaffold(
      body: paginas[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: 'Reels',
          ),
          NavigationDestination(icon: Icon(Icons.send), label: 'Enviar'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Procurar'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}