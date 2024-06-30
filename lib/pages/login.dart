import 'package:digitalevent/pages/home.dart';
import 'package:digitalevent/pages/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Longin / Antonio", style: TextStyle(fontSize: 20.0),),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
              }, 
              style: const ButtonStyle(
               backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurple),
                 ),
              child: Text('Home', style: TextStyle(color: Colors.white),),
              
              ),
               ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
              }, 
              style: const ButtonStyle(
               backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurple),
                 ),
              child: Text('Registro', style: TextStyle(color: Colors.white),),
              
              ),
          ],
        ),
      ),
    );
  }
}