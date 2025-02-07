import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/services/api_service.dart';
import 'package:tp2_flutter_grupo12/models/jugador_model.dart';
import 'package:tp2_flutter_grupo12/screens/jugadores_details.dart';

class JugadoresListScreen extends StatefulWidget {
  const JugadoresListScreen({super.key});

  @override
  _JugadoresListScreenState createState() => _JugadoresListScreenState();
}

class _JugadoresListScreenState extends State<JugadoresListScreen> {
  late Future<List<Jugador>> jugadoresFuture;

  @override
  void initState() {
    super.initState();
    jugadoresFuture = _fetchJugadores();
  }

  Future<List<Jugador>> _fetchJugadores() async {
    final apiService = ApiService();
    return await apiService.getJugadores();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Jugadores'),
        backgroundColor: theme.primaryColor,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: FutureBuilder<List<Jugador>>(
        future: jugadoresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No hay jugadores disponibles.',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
            );
          }

          final jugadores = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: jugadores.length,
            itemBuilder: (context, index) {
              final jugador = jugadores[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: theme.cardColor,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    jugador.nombre,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  subtitle: Text(
                    jugador.equipo,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: theme.iconTheme.color),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JugadorDetailScreen(jugador: jugador),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
