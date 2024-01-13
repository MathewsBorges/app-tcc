import 'package:flutter/material.dart';
import 'package:saude/src/models/Agenda.dart';
import '/src/pages/loginPage.dart';


void main() async {
  runApp(const MyApp());
 teste(1);
}

 teste(id) async{
  List<Agenda> agenda = await Agenda.getAgendamentosByPaciente(id);
  print(agenda.isEmpty);
  agenda.forEach((element) {print(element.paciente?.nome);});
  
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
