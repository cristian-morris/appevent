import 'package:flutter/material.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({super.key});

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  final List<Map<String, String>> notifications = [
    {
      "title": "Circo de los Tormentos en Playa del Carmen",
      "description": "Ven y maravíllate con los actos más impresionantes.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Festival de Luces en la Ciudad",
      "description": "Una experiencia visual que no te puedes perder.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Concierto de Rock en el Anfiteatro",
      "description": "Prepárate para una noche de energía y grandes éxitos.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Feria del Libro en la Plaza",
      "description":
          "Aprovecha las ofertas y conoce a tus autores favoritos en persona.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Exposición de Arte Moderno en el Museo",
      "description":
          "La Exposición de Arte Moderno en el Museo abre sus puertas a las 11:00 el 2024-07-11.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Carnaval de Verano en la Playa",
      "description": "Disfruta de música, comida y actividades junto al mar.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Carrera de Bicicletas en el Parque",
      "description":
          "La Carrera de Bicicletas en el Parque empieza a las 08:00 el 2024-07-13.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Mercado Artesanal en el Centro",
      "description":
          "Encuentra productos únicos hechos a mano por artesanos locales.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Noche de Cine al Aire Libre",
      "description":
          "Trae tu manta y disfruta de una película bajo las estrellas.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Festival Gastronómico en el Malecón",
      "description":
          "Deléitate con una variedad de platillos de todo el mundo.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Concurso de Fotografía en la Playa",
      "description":
          "Captura las mejores imágenes y gana premios emocionantes.",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Torneo de Voleibol en la Arena",
      "description": "Únete al juego y muestra tus habilidades en la cancha.",
      "image": "https://via.placeholder.com/150"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        elevation: 0,
        title: Text(
          "Notificaciones",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color.fromRGBO(186, 104, 200, 1),
              ),
            ),
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Container(
              height: 130,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        notifications[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          notifications[index]['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[300],
                            fontSize: 17,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          notifications[index]['description']!,
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
