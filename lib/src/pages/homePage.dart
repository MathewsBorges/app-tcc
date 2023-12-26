///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/models/Paciente.dart';
import 'package:saude/src/pages/loginPage.dart';
import 'package:saude/src/pages/unidadesPage.dart';

class home extends StatelessWidget {
  static Paciente? paciente;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f6fa),
      body:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 56, 0, 0),
                  child: Text("+Saúde: Nós Cuidamos de Você",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.getFont('Outfit',
                          textStyle: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500))),
                ),
                Divider(
                  color: Color.fromARGB(255, 1, 165, 102),
                  height: 50,
                  thickness: 0,
                  indent: 20,
                  endIndent: 40,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${comprimentar()}",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.getFont('Outfit',
                              textStyle: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700)),
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${paciente?.nome} ${paciente?.sobrenome}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.getFont('Outfit',
                            textStyle: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 21, 173, 97))),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 8, 0),
                  child: Text(
                    "Próximas consultas",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.getFont('Outfit',
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ),
                ConstrainedBox(
                  constraints: new BoxConstraints(
                      minHeight: 50, maxHeight: 150, maxWidth: 400),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(4),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      Container(
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
                                    "11/01/2024",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.getFont('Outfit',
                                        textStyle: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500)),
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
                                    "Unidade Básica de Saúde 07",
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
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      child: Text(
                                        "08:00",
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
                                      side: BorderSide(
                                          color: Color(0x4d9e9e9e), width: 0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      child: Text(
                                        "Dr. Fabrício",
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
                      ),
                
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 22, 16, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 57, 210, 192),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: IconButton(icon:Icon
                                    (Icons.edit_calendar_rounded,
                                    color: Color(0xffffffff),
                                    size: 52),
                                    onPressed: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => unidadesPage()));
                                     },
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Agendar Consulta",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text(
                                      "Agende suas consultas de forma\n rápida e fácil aqui",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  71, 255, 255, 255))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 75, 57, 239),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Icon(
                                    Icons.local_phone_outlined,
                                    color: Color(0xffffffff),
                                    size: 52,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Ligar para Unidade",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text(
                                      "Precisando de ajuda ligue para nossa \n central de atendimento",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  71, 255, 255, 255))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 57, 210, 192),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Icon(
                                    Icons.app_registration_rounded,
                                    color: Color(0xffffffff),
                                    size: 52,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Minhas Consultas",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text(
                                      "Visualize suas consultas aqui",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  71, 255, 255, 255))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      
      
    );
  }

  comprimentar() {
    DateTime horario = DateTime.now().subtract(Duration(hours: 3));
  
    var hora = horario.hour;

    if (hora < 12) {
      return 'Bom Dia,';
    } else if (hora < 18) {
      return 'Boa Tarde,';
    } else {
      return 'Boa Noite,';
    }
  }
}
