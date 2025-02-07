import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tp2_flutter_grupo12/models/jugador_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String apiUrl = dotenv.env['API_URL'] ?? ''; // Cargar URL desde .env

  Future<List<Jugador>> getJugadores() async {
    if (apiUrl.isEmpty) {
      throw Exception('URL de la API no está configurada correctamente');
    }

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final String decodedBody =
          utf8.decode(response.bodyBytes); // Decodifica UTF-8
      final List<dynamic> data = json.decode(decodedBody);
      return data.map((json) => Jugador.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los jugadores');
    }
  }
}
