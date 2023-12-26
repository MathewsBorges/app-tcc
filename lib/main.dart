import 'package:flutter/material.dart';

import 'package:saude/src/models/Paciente.dart';
import 'package:saude/src/models/Unidade.dart';
import 'package:saude/src/pages/loginPage.dart';
import 'package:saude/src/pages/homePage.dart';

void main() async {
  runApp(const MyApp());
// teste();
}

Future<void> teste() async {
 List<Unidade> unidades = await Unidade.listarUnidades("1");
  unidades.forEach((element) {
    print(element.nome);

  });
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '+Saúde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}
