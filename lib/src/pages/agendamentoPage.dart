import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/pages/medicosPage.dart';

import '../models/Medico.dart';
import '../models/Unidade.dart';

class agendamentoPage extends StatefulWidget {
  const agendamentoPage({Key? key}) : super(key: key);

  static Unidade? unidade = medicosPage.unidade;
  static Medico? medico;

  @override
  State<agendamentoPage> createState() => _agendamentoPageState();
}

class _agendamentoPageState extends State<agendamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: corpo(context),
    );
  }

  appBar(context) {
    return AppBar(
      title: Text("Selecione a Data/Horário"),
    );
  }

  corpo(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Local da consulta",
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Color(0xff1b2025),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0x1fffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0x568d8d8d), width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
            child: Text(
              "${agendamentoPage.unidade?.nome}",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 22,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Text(
            agendamentoPage.medico?.sexo == 'M'
                ? "Dr. ${agendamentoPage.medico?.nome} ${agendamentoPage.medico?.sobrenome}"
                : "Dra. ${agendamentoPage.medico?.nome} ${agendamentoPage.medico?.sobrenome}",
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: GoogleFonts.getFont('Outfit',
                textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff38d1bf))),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "${agendamentoPage.medico?.especialidade}",
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: GoogleFonts.getFont('Outfit',
                textStyle: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey[800])),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Text(
            "Dias Disponíveis",
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Color(0xff000000),
            ),
          ),
        ),
      ],
    );
  }
}
