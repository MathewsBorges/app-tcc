import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/controllers/AgendaController.dart';
import 'package:saude/src/pages/minhasConsultas.dart';

import '../models/Agenda.dart';

class cancelarConsulta extends StatefulWidget {
  const cancelarConsulta({Key? key}) : super(key: key);
  static Agenda? agendamento;

  @override
  State<cancelarConsulta> createState() => _cancelarConsultaState();
}

class _cancelarConsultaState extends State<cancelarConsulta> {
  final TextEditingController _unidade = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _horario = TextEditingController();
  final TextEditingController _medico = TextEditingController();
  AgendaController agendaController = new AgendaController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _unidade.text = cancelarConsulta.agendamento!.horario!.unidade!.nome;
    _data.text = converterData(cancelarConsulta.agendamento!.data);
    _horario.text = cancelarConsulta.agendamento!.horario!.horario;
    _medico.text = cancelarConsulta.agendamento!.horario!.medico!.nome +
        " " +
        cancelarConsulta.agendamento!.horario!.medico!.sobrenome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: corpo(context),
      appBar: appBar(context),
    );
  }

  corpo(context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _unidade,
                enabled: false,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: design('Unidade', ''),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _data,
                obscureText: false,
                enabled: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: design('Data', ''),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _horario,
                enabled: false,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: design('Horário', ''),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 52),
              child: TextField(
                controller: _medico,
                enabled: false,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: design('Médico', ''),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                int status = await removerConsulta();

                if (status == 200) {
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Sucesso',
                      message: 'Sua consulta foi desmarcada com sucesso',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                  Future.delayed(Duration(seconds: 2), () {
                    // Após o atraso, navegue para a próxima página
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => minhasConsultas(),
                      ),
                    );
                  });
                }
                if (status == 404) {
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Ops',
                      message: 'Não foi possível cancelar a consulta',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.warning,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
              color: Color.fromARGB(255, 255, 21, 0),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Cancelar Agendamento",
                style: GoogleFonts.getFont('Outfit',
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
              textColor: Color(0xffffffff),
              height: 50,
              minWidth: 230,
            )
          ],
        ));
  }

  appBar(context) {
    return AppBar(
      title: Text("Minha Consulta"),
    );
  }

  design(label, hint, {tipo = 1}) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      labelText: label,
      labelStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      hintText: hint,
      hintStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      filled: true,
      fillColor: Color(0xfff1f3f7),
      isDense: false,
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
    );
  }

  String converterData(String dataOriginal) {
    DateTime data = DateTime.parse(dataOriginal);

    // Formata a data para o formato desejado "dd/mm/yyyy"
    String dataFormatada = "${data.day.toString().padLeft(2, '0')}/"
        "${data.month.toString().padLeft(2, '0')}/"
        "${data.year.toString()}";

    return dataFormatada;
  }

  Future<int> removerConsulta() async {
    int status =
        await agendaController.remover(cancelarConsulta.agendamento!.codigo);
    print(status);

    return status;
  }
}
