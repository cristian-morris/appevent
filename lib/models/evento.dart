import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Evento {
  final int id;
  final String nombre;
  final DateTime fechaInicio;
  final DateTime fechaTermino;
  final String hora;
  final String ubicacion;
  final int maxPer;
  final String estado;
  final String tipoEvento;
  final String organizadorNombre;
  final String autorizadoPorNombre;
  final String categoriaNombre;
  final String imagenUrl;

  Evento({
    required this.id,
    required this.nombre,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.hora,
    required this.ubicacion,
    required this.maxPer,
    required this.estado,
    required this.tipoEvento,
    required this.organizadorNombre,
    required this.autorizadoPorNombre,
    required this.categoriaNombre,
    required this.imagenUrl,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json["evento_id"],
      nombre: json["nombre_evento"],
      fechaInicio: DateTime.parse(json["fecha_inicio"]),
      fechaTermino: DateTime.parse(json["fecha_termino"]),
      hora: json["hora"],
      ubicacion: json["ubicacion"],
      maxPer: json["max_per"],
      estado: json["estado"],
      tipoEvento: json["tipo_evento"],
      organizadorNombre: json["organizador_nombre"],
      autorizadoPorNombre: json["autorizado_nombre"],
      categoriaNombre: json["categoria_nombre"],
      imagenUrl: json["imagen_url"],
    );
  }
}

Future<List<Evento>> fetchEvento() async {
  final url = Uri.parse('https://digital-event-hub.fly.dev/api/events');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((evento) => Evento.fromJson(evento)).toList();
  } else {
    throw Exception('Failed to load eventos');
  }
}
