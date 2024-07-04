import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        title: Text("Configuracion", textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text("ejemplo", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text("ejemplo", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text("ejemplo", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text("ejemplo", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text("ejemplo", style: TextStyle(fontSize: 20),)
              ],
            ),
          )
        ],
      ),
    );
  }
}