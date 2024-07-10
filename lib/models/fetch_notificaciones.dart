import 'dart:convert';
import 'package:http/http.dart' as http;
import 'notificacion.dart'; // Asegúrate de tener la clase Notificacion en un archivo separado o en el mismo archivo

Future<List<Notificacion>> fetchNotificaciones() async {
  final url = Uri.parse('http://192.168.1.122:3000/api/notifications/getAll');
  print('Fetching notifications from $url');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print('Response received: $jsonResponse');
      return jsonResponse
          .map((notificacion) => Notificacion.fromJson(notificacion))
          .toList();
    } else {
      print(
          'Failed to load notifications. Status code: ${response.statusCode}');
      throw Exception('Failed to load notifications');
    }
  } catch (e) {
    print('Error occurred: $e');
    throw Exception('Failed to load notifications');
  }
}
