class Notificacion {
  final int id;
  final String titulo;
  final String cuerpo;
  final String fecha;

  Notificacion({
    required this.id,
    required this.titulo,
    required this.cuerpo,
    required this.fecha,
  });

  factory Notificacion.fromJson(Map<String, dynamic> json) {
    return Notificacion(
      id: json['notificacion_id'],
      titulo: json['titulo'],
      cuerpo: json['cuerpo'],
      fecha: json['fecha'],
    );
  }
}
