import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/controllers/AgendaController.dart';
import 'package:saude/src/controllers/HorariosController.dart';
import 'package:saude/src/models/Horarios.dart';
import 'package:saude/src/pages/homePage.dart';
import 'package:saude/src/pages/medicosPage.dart';

import '../models/Medico.dart';
import '../models/Unidade.dart';

class agendamentoPage extends StatefulWidget {
  const agendamentoPage({Key? key}) : super(key: key);

  static Unidade? unidade;
  static Medico? medico;
  static Horarios? horarioConsulta;

  @override
  State<agendamentoPage> createState() => _agendamentoPageState();
}

class Datas {
  String data = "";
  String dia = "";
  int? diaSemana = 0;
  Datas(this.data, this.dia, this.diaSemana);
}

bool isSelected = false;
bool isSelectedTime = false;

String? selectedDay = null;
int? selectedDayWeek = null;
String? selectedTime = null;

class _agendamentoPageState extends State<agendamentoPage> {
  static HorariosController horariosController = new HorariosController();
  static AgendaController agendaController = new AgendaController();
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
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: Container(
                  height: 90,
                  child: FutureBuilder<List<Datas>>(
                      future: gerarDatas(),
                      builder: ((context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Não foi possível carregar os dias'));
                        } else {
                          List<Datas>? data = snapshot.data;
                          // print(medicos?[0].nome);
                          return Container(
                            height: 10,
                            constraints:
                                BoxConstraints(maxHeight: 10, minHeight: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data?.length,
                              itemBuilder: (context, index) {
                                return cardData(data![index]);
                              },
                            ),
                          );
                        }
                      })),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Text(
                  "Horários Disponíveis",
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
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: Container(
                    height: 70,
                    child: selectedDay != null
                        ? FutureBuilder<List<Horarios>>(
                            future: getHorariosDisponives(),
                            builder: ((context, snapshot) {
                              print(snapshot.data);
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text(
                                        'Não foi possível carregar os dias'));
                              } else {
                                List<Horarios>? horario = snapshot.data;
                                // print(medicos?[0].nome);
                                return Container(
                                  height: 10,
                                  constraints: BoxConstraints(
                                      maxHeight: 10, minHeight: 10),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: horario?.length,
                                    itemBuilder: (context, index) {
                                      return cardHorario(horario![index]);
                                    },
                                  ),
                                );
                              }
                            }))
                        : Center(
                            child: Text(
                                "Escolha um dia para visualizar os horários"))),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 42, 16, 32),
                  child: selectedTime != null
                      ? MaterialButton(
                          onPressed: () async {
                            int status = await agendarConsulta();
                            if (status == 200) {
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Sucesso',
                                  message:
                                      'Sua consulta foi agendada com sucesso, lembre-se de levar sua indentidade e cartão SUS no Dia',

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
                                    builder: (context) => home(),
                                  ),
                                );
                              });
                            }
                            if (status == 500) {
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Ops',
                                  message:
                                      'Você já possui uma consulta agendada para o dia de hoje, não é possivel agendar a consulta',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.warning,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          },
                          color: Color(0xff01978b),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Agendar Consulta",
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
                      : Text("Selecione o Dia e o horário"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 320,
                    alignment: Alignment.center,
                    child: Text(
                      "Lembre-se sua consulta somente será válida no dia mediante a apresentação de identidade e cartão SUS",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<List<Datas>> gerarDatas() async {
    // Limpando a lista de datas antes de gerar novas datas
    List<Datas> datas = [];
    List<int> dias = await horariosController.listarDias(
        agendamentoPage.medico?.codigo, agendamentoPage.unidade?.codigo);
    // Data de início: primeiro dia deste mês
    DateTime startDate = DateTime.now();

    // Data final: 3 meses (aproximadamente 90 dias) a partir do início
    DateTime endDate = startDate.add(Duration(days: 90));

    // Mapeando os dias da semana conforme sua especificação
    Map<int, int> dayMapping = {
      1: 2, // Segunda-feira
      2: 3, // Terça-feira
      3: 4, // Quarta-feira
      4: 5, // Quinta-feira
      5: 6, // Sexta-feira
      6: 7, // Sábado
      7: 1 // Domingo
    };
    List<String> diasSemana = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];
    // Iterar pelas datas no intervalo
    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(Duration(days: 1))) {
      int? adjustedDay = dayMapping[date.weekday];
      if (dias.contains(adjustedDay)) {
        // Formatando a data para o padrão "dd/mm/yyyy"
        String formattedDate =
            "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";
        datas.add(new Datas(formattedDate, diasSemana[date.weekday],
            adjustedDay)); // Adicionando a data formatada à lista
      }
    }

    return datas;
  }

  Future<List<Horarios>> getHorariosDisponives() async {
    List<Horarios> horario = await horariosController.listarHorariosDisponiveis(
        agendamentoPage.medico?.codigo,
        agendamentoPage.unidade?.codigo,
        selectedDay,
        selectedDayWeek);
    return horario;
  }

  Widget cardData(Datas data) {
    bool isDaySelected = selectedDay == data.data;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isDaySelected) {
            selectedDay = null;
            selectedDayWeek =
                null; // Desselecionar o dia se já estiver selecionado
          } else {
            selectedDay = data.data;
            selectedDayWeek =
                data.diaSemana; // Desselecionar o dia se já estiver selecionado
            // Selecionar o dia
          }
        });
      },
      child: Card(
        color: isDaySelected
            ? Color(0xff38d1bf)
            : null, // Se for o dia selecionado, muda para verde
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  data.data,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont('Outfit',
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color:
                              isDaySelected ? Colors.white : Colors.grey[700])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "${data.dia}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont('Outfit',
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color:
                              isDaySelected ? Colors.white : Colors.grey[700])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHorario(Horarios horario) {
    bool isTimeSelected = selectedTime == horario.horario;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isTimeSelected) {
            selectedTime =
                null; // Desselecionar o dia se já estiver selecionado
          } else {
            selectedTime = horario
                .horario; // Desselecionar o dia se já estiver selecionado
            agendamentoPage.horarioConsulta = horario;

            // Selecionar o dia
          }
        });
      },
      child: Card(
        color: isTimeSelected
            ? Color(0xff38d1bf)
            : null, // Se for o dia selecionado, muda para verde
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  horario.horario,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont('Outfit',
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: isTimeSelected
                              ? Colors.white
                              : Colors.grey[700])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> agendarConsulta() async {
    String? data = converterData(selectedDay);
    print(data);
    int? horario = agendamentoPage.horarioConsulta?.codigo;
    print(horario);

    int? paciente = home.paciente?.codigo;
    print(paciente);

    int status = await agendaController.agendar(data, horario, paciente);
    return status;
  }
}

String converterData(String? data) {
  // Divida a string da data nos componentes do dia, mês e ano
  List<String>? componentes = data?.split('/');

  // Crie um objeto DateTime com os componentes
  DateTime dateTime = DateTime(
    int.parse(componentes![2]), // ano
    int.parse(componentes![1]), // mês
    int.parse(componentes![0]), // dia
  );

  // Formate a data para o formato desejado "yyyy-mm-dd"
  String dataFormatada =
      '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';

  return dataFormatada;
}
