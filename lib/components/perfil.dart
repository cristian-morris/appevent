import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          "Perfil",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple[300],
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Usuario:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Gonzalo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.black),
                    title: Text('Gmail:'),
                    tileColor: Colors.purple,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.black),
                    title: Text('Teléfono:'),
                    tileColor: Colors.purple,
                  ),
                  ListTile(
                    title: Text('Política de privacidad'),
                    trailing: Icon(Icons.policy, color: Colors.black),
                    tileColor: Colors.purple,
                    onTap: () {
                      // Navigate to privacy policy
                    },
                  ),
                  ListTile(
                    title: Text('Centro de ayuda'),
                    trailing: Icon(Icons.help, color: Colors.black),
                    tileColor: Colors.purple,
                    onTap: () {
                      // Navigate to help center
                    },
                  ),
                  ListTile(
                    title: Text('Cerrar sesión'),
                    trailing: Icon(Icons.exit_to_app, color: Colors.black),
                    tileColor: Colors.purple,
                    onTap: () {
                      // Handle sign out
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

