import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/controllers/MedicoController.dart';
import 'package:saude/src/models/Medico.dart';
import 'package:saude/src/models/Unidade.dart';
import 'package:saude/src/pages/agendamentoPage.dart';
import 'package:saude/src/pages/unidadesPage.dart';

class medicosPage extends StatefulWidget {
  const medicosPage({Key? key}) : super(key: key);
  static Unidade? unidade;
  static MedicoController medico = new MedicoController();

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

  appBar(context) {
    return AppBar(
      title: Text("Selecione o Médico"),
    );
  }

  body(context) {
    return FutureBuilder<List<Medico>>(
        future: listarMedicos(medicosPage.unidade?.codigo.toString()),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print(medicosPage.unidade?.codigo);

            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Não foi possível carregar os médicos'));
          } else {
            List<Medico>? medicos = snapshot.data;
            // print(medicos?[0].nome);
            return ListView.builder(
              itemCount: medicos?.length,
              itemBuilder: (context, index) {
                //Unidade? unidade = unidades?[index];
                return unidadeCard(medicos![index]);
              },
            );
          }
        }));
  }

  static Future<List<Medico>> listarMedicos(id) async {
    List<Medico> medicos = await Medico.listarMedicosPorUnidade(id);
    return medicos;
  }

  unidadeCard(Medico medico) {
    return GestureDetector(
        onTap: () {
          agendamentoPage.medico = medico;
          agendamentoPage.unidade = medicosPage.unidade;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => agendamentoPage()));
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Container(
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
                        medico.sexo == 'M'
                            ? "Dr. ${medico.nome} ${medico.sobrenome}"
                            : "Dra. ${medico.nome} ${medico.sobrenome}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.getFont('Outfit',
                            textStyle: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    IconButton(
                        onPressed: () => {
                              agendamentoPage.medico = medico,
                              agendamentoPage.unidade = medicosPage.unidade,
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => agendamentoPage()))
                            },
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
                        "CRM ${medico.crm}",
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
                        color: medico.especialidade == 'Clínico Geral'
                            ? Color(0xff00d59e)
                            : Color.fromARGB(255, 0, 122, 198),
                        shadowColor: Color(0xff000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Color(0x4d9e9e9e), width: 0),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          child: Text(
                            "${medico.especialidade}",
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
        ));
  }
}
