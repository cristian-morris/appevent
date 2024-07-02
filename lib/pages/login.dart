// ignore: file_names
import 'package:digitaleventhub/pages/home.dart';
import 'package:digitaleventhub/pages/Register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "!Bienvenido de Nuevo!",
                    style: GoogleFonts.openSans(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Inicia Sesión para poder acceder a las funciones y perfil, así como las muchas sorpresa que te esperan.",
                    style: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 310,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(225, 185, 166, 224),
                        labelText: 'Correo Electrónico:',
                        labelStyle: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 310,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(225, 185, 166, 224),
                        labelText: 'Contraseña:',
                        labelStyle: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 270,
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              )); //
                        },
                        style: const ButtonStyle(
                          shape: WidgetStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.deepPurple),
                        ),
                        child: Text(
                          'Iniciar Sesión',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Olvidastes tu Contraseña?',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          // Aquí puedes añadir la lógica que quieres ejecutar al presionar el botón
                        },
                        child: Text(
                          'Restablecer',
                          style: GoogleFonts.openSans(
                              fontSize: 17,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'O',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 336,
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.white),
                          shape: WidgetStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          side: WidgetStatePropertyAll<BorderSide>(
                              BorderSide(width: 2.0, color: Colors.deepPurple)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Inicia Sessión Con Google',
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Image(image: AssetImage('assets/google.png')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        'No tienes cuenta?',
                        style: GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          // Aquí puedes añadir la lógica que quieres ejecutar al presionar el botón
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child: Text(
                          'Registrate',
                          style: GoogleFonts.openSans(
                              fontSize: 17,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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
