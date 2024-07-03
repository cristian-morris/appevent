import 'package:digitalevent/components/notificaciones.dart';
import 'package:digitalevent/components/perfil.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.purple[300],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[300],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    "LOGO",
                    style: TextStyle(fontSize: 35),
                    ),
                ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Perfil",
                    style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Perfil(),));
                    },
                ),
                  ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(
                    "Notificaciones",
                    style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notificaciones(),));
                    },
                )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            sectionTitle('EVENTOS PÚBLICOS'),
            eventList([
              
            ]),
            sectionTitle('EVENTOS PRIVADOS'),
            eventList([
              
            ]),
          ],
        ),
      ),
    );
  }
}
Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget eventList(List<String> imagePaths) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: imagePaths.map((imagePath) => eventCard(imagePath)).toList(),
      ),
    );
  }

  Widget eventCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'EVENTO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Descripción, de la de la a descripción, descripción, descripción, descripción, hola.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
