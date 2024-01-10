import 'package:flutter/material.dart';
import 'package:saude/src/models/Horarios.dart';
import 'package:saude/src/pages/loginPage.dart';


void main() async {
  runApp(const MyApp());
 teste();
}

Future<void> teste() async {
 List<int> horarios = await Horarios.listarDiasMedico(1, 1);
   horarios.forEach((element) {print(element);});
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
