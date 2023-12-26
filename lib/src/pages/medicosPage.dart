import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/models/Medico.dart';
import 'package:saude/src/models/Unidade.dart';

class medicosPage extends StatefulWidget {
  const medicosPage({Key? key}) : super(key: key);
  static Medico? medico;
  static Unidade? unidade;
  @override
  State<medicosPage> createState() => _medicosPageState();
}

class _medicosPageState extends State<medicosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }


appBar(context){
  return AppBar(
    title: Text("Selecione o Local"),
  );
}

body(context){
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.fromLTRB(16, 16, 0, 4), child: Text("Selecione o médico para realizar o atendimento"),),
         Padding(padding: EdgeInsets.fromLTRB(8, 4, 8, 4), child:   Container(
                        margin: EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width,
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
                                    "${medicosPage.medico?.nome}",
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
                                    "CRM ${medicosPage.medico?.crm}",
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
                                        "${medicosPage.medico?.especialidade}",
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
                )

      ],
    ),
  );
}

}