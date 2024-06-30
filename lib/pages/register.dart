import 'package:digitalevent/pages/home.dart';
import 'package:digitalevent/pages/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Registro / Antonio", style: TextStyle(fontSize: 20.0),),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              }, 
              style: const ButtonStyle(
               backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepPurple),
                 ),
              child: Text('Login', style: TextStyle(color: Colors.white),),
              
              ),
          ],
        ),
      ),
    );
  }
}