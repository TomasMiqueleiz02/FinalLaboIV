class Jugador {
  final String id;
  final String nombre;
  final String equipo;
  final String nacionalidad;

  Jugador({
    required this.id,
    required this.nombre,
    required this.equipo,
    required this.nacionalidad,
  });

  factory Jugador.fromJson(Map<String, dynamic> json) {
    return Jugador(
      id: json['id'],
      nombre: json['nombre'],
      equipo: json['equipo'],
      nacionalidad: json['nacionalidad'],
    );
  }
}
