import 'package:flutter/material.dart';
import 'home_page.dart';

// https://www.youtube.com/watch?v=C-fKAzdTrLU&list=PLPe6MwsxMZ1PlG3XrZONUGeOgEExAIz1o

// Seguir por aquí:
// https://youtu.be/C-fKAzdTrLU?list=PLPe6MwsxMZ1PlG3XrZONUGeOgEExAIz1o&t=1396
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Elimina la marca de debug:
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: const HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Botón pulsado');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        //NavigationDestinationLabelBehavior? onlyShowSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
