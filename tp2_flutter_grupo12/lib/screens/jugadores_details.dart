import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/models/jugador_model.dart';

class JugadorDetailScreen extends StatelessWidget {
  final Jugador jugador;

  const JugadorDetailScreen({super.key, required this.jugador});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(jugador.nombre),
        backgroundColor: theme.primaryColor,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    jugador.nombre,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Equipo: ${jugador.equipo}',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Nacionalidad: ${jugador.nacionalidad}',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.textTheme.bodyLarge?.color,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Volver', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
