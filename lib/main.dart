import 'package:flutter/material.dart';

import 'package:saude/src/models/Paciente.dart';
import 'package:saude/src/pages/loginPage.dart';
import 'package:saude/src/pages/homePage.dart';

void main() async {
  runApp(const MyApp());
 
}

Future<void> teste() async {
 List<Paciente> pacientes = await Paciente.carregarPacientes();
  pacientes.forEach((element) {
    print(element.nome);
    print(element.dataNascimento);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iManager Rede LVD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}
