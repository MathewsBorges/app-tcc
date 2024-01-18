import 'Medico.dart';
import 'settings/AgendaPropriedade.dart';

import 'Horarios.dart';
import 'Paciente.dart';
import 'Unidade.dart';
import 'settings/connection.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Agenda {
  int codigo = 0;
  Paciente? paciente;

  Horarios? horario;

  String data = "";

  Agenda(this.paciente, this.horario, this.data);

  Agenda.fromMap(Map map) {
    codigo = map[AgendaPropriedades.codigo];
    paciente = Paciente.fromMap(map[AgendaPropriedades.paciente]);
    horario = Horarios.fromMap(map[AgendaPropriedades.horario]);
    data = map[AgendaPropriedades.data];
  }

  static Future<List<Agenda>> getAgendamentosByPaciente(id) async {
    try {
      var url = Uri.http("${connection.address}", '/agenda/paciente/');
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      http.Response resposta = await http.post(url,
          headers: headers,
          body: jsonEncode({"id": id}),
          encoding: Encoding.getByName('utf-8'));

      var dados = json.decode(resposta.body);
      print(resposta.body);
      List<Agenda> lista = [];
      try {
        for (Map agenda in dados) {
          lista.add(Agenda.fromMap(agenda));
        }
      } catch (e) {
        print(e);
      }

      return lista;
    } catch (e) {
      return [];
    }
  }

  static Future<int> agendarConsulta(
      String data, int horario, int paciente) async {
    try {
      var url = Uri.http("${connection.address}", '/agenda/');
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      http.Response resposta = await http.post(url,
          headers: headers,
          body: jsonEncode(
              {"data": data, "horario": horario, "paciente": paciente}),
          encoding: Encoding.getByName('utf-8'));

      var dados = json.decode(resposta.body);

      return dados;
    } catch (e) {
      return 404;
    }
  }

  static Future<int> removerConsulta(id) async {
    try {
      var url = Uri.http("${connection.address}", '/agenda/');
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      http.Response resposta = await http.delete(url,
          headers: headers,
          body: jsonEncode({"id": id}),
          encoding: Encoding.getByName('utf-8'));

      var dados = json.decode(resposta.body);

      return dados;
    } catch (e) {
      return 404;
    }
  }
}
