import 'dart:convert';
import 'package:http/http.dart' as http;

class Evento {
  final int id;
  final String nombre;
  final DateTime fecha_inicio;
  final DateTime fecha_termino;
  final String hora;
  final String tipo_evento_nombre;
  final String categoria_nombre;
  final String ubicacion;
  final int max_per;
  final String estado;
  final String autorizado_por_nombre;

  Evento({
    required this.id,
    required this.nombre,
    required this.fecha_inicio,
    required this.fecha_termino,
    required this.hora,
    required this.tipo_evento_nombre,
    required this.categoria_nombre,
    required this.ubicacion,
    required this.max_per,
    required this.estado,
    required this.autorizado_por_nombre,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json["evento_id"],
      nombre: json["nombre"],
      fecha_inicio: json["fecha_inicio"],
      fecha_termino: json["fecha_termino"],
      hora: json["hora"],
      tipo_evento_nombre: json["tipo_evento_nombre"],
      categoria_nombre: json["categoria_nombre"],
      ubicacion: json["ubicacion"],
      max_per: json["max_per"],
      estado: json["estado"],
      autorizado_por_nombre: json["autorizado_por_nombre"],
    );
  }
}

Future<List<Evento>> fetchEvento() async {
  final url = Uri.parse('http://169.254.80.3:3007/api/eventos');
  print('Fetching eventos from $url');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    print('Response received: $jsonResponse');
    return jsonResponse.map((evento) => Evento.fromJson(evento)).toList();
  } else {
    throw Exception('Failed to load evento');
  }
}
