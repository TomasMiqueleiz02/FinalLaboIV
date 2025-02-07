import 'dart:developer';
import 'package:flutter/material.dart';
import 'jugadores_list_screen.dart';
import 'package:tp2_flutter_grupo12/widgets/drawner_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leadingWidth: 40,
        toolbarHeight: 80,
        backgroundColor: theme.primaryColor,
      ),
      drawer: DrawerMenu(),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a la App de Jugadores',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JugadoresListScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.textTheme.bodyLarge?.color,
              ),
              child: const Text('Ver Jugadores'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        child: Icon(Icons.sports_soccer, color: theme.iconTheme.color),
        onPressed: () {
          log('click button');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JugadoresListScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
