import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:saude/src/pages/homePage.dart';
import 'package:saude/src/pages/unidadesPage.dart';

import '../controllers/AgendaController.dart';
import '../models/Agenda.dart';

class minhasConsultas extends StatefulWidget {
  const minhasConsultas({Key? key}) : super(key: key);
  static AgendaController agendaController = new AgendaController();

  @override
  State<minhasConsultas> createState() => _minhasConsultasState();
}

class _minhasConsultasState extends State<minhasConsultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: corpo(context),
      appBar: appBar(context),
      floatingActionButton: botaoFlutuante(),
    );
  }

  appBar(context) {
    return AppBar(
      title: Text("Minhas Consultas"),
    );
  }

  botaoFlutuante() {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => unidadesPage()));
        },
        child: Icon(Icons.add));
  }

  corpo(context) {
    return FutureBuilder<List<Agenda>>(
        future: getAgendamentosByPaciente(home.paciente?.codigo),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Não foi possível carregar os agendamentos'));
          } else {
            List<Agenda>? agendamentos = snapshot.data;

            if (agendamentos!.length > 0) {
              return ListView.builder(
                itemCount: agendamentos?.length,
                itemBuilder: (context, index) {
                  return cardConsulta(agendamentos![index]);
                },
              );
            } else {
              return Center(
                child: Text("Você não tem consultas agendadas"),
              );
            }
          }
        }));
  }

  Future<List<Agenda>> getAgendamentosByPaciente(id) async {
    List<Agenda> agenda =
        await minhasConsultas.agendaController.getAgendamnetosByPaciente(id);
    return agenda;
  }

  cardConsulta(Agenda agenda) {
    DateTime dateTime = DateTime.parse(agenda.data);

    // Formatando a data para o formato DD/MM/YYYY
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return Container(
      margin: EdgeInsets.all(4),
      width: 300,
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "${formattedDate}",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.getFont('Outfit',
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                ),
              ),
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                    size: 18,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  "${agenda.horario?.unidade?.nome}",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.getFont('Outfit',
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700])),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  margin: EdgeInsets.all(4),
                  color: Color(0xff00acff),
                  shadowColor: Color(0xff000000),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      "${agenda.horario?.horario}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.getFont('Outfit',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(4),
                  color: Color(0xff00d59e),
                  shadowColor: Color(0xff000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Color(0x4d9e9e9e), width: 0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      agenda.horario?.medico?.sexo == 'M'
                          ? "Dr. ${agenda.horario?.medico?.nome} ${agenda.horario?.medico?.sobrenome}"
                          : "Dra. ${agenda.horario?.medico?.nome} ${agenda.horario?.medico?.sobrenome}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.getFont('Outfit',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
