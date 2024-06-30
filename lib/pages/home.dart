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
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        title: Text("Digital Event", textAlign: TextAlign.center,),
        centerTitle: true,
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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home / Gonzalo", style: TextStyle(fontSize: 30.0),),
          ],
        ),
      ),
    );
  }
}