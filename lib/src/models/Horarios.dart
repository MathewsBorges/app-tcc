import 'settings/HorariosPropriedade.dart';
import 'settings/connection.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'Medico.dart';
import 'Unidade.dart';

class Horarios {
  int codigo = 0;
  int diaSemana = 0;
  String horario = "8:00";
  Medico? medico;
  Unidade? unidade;

  Horarios(this.codigo, this.diaSemana, this.horario, this.medico);

  Horarios.fromMap(Map map) {
    codigo = map[HorariosPropriedades.codigo];
    diaSemana = map[HorariosPropriedades.dia];
    horario = map[HorariosPropriedades.horario];
    medico = Medico.fromMap(map[HorariosPropriedades.medico]);
    unidade = Unidade.fromMap(map[HorariosPropriedades.unidade]);
  }

  static Future<List<int>> listarDiasMedico(int id, int unidade) async {
    try {
      var url = Uri.http("${connection.address}", '/horarios/medico/');
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      http.Response resposta = await http.post(url,
          headers: headers,
          body: jsonEncode({"medico": id, "unidade": unidade}),
          encoding: Encoding.getByName('utf-8'));

      var dados = json.decode(resposta.body);

      List<Horarios> lista = [];
      List<int> dias = [];

      for (Map horario in dados) {
        lista.add(Horarios.fromMap(horario));
      }

      for (Horarios horario in lista) {
        if (!dias.contains(horario.diaSemana)) {
          dias.add(
              horario.diaSemana); // Adiciona o atributo diaSemana à lista dias
        }
      }

      return dias;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Horarios>> listarHorariosMedico(
      String data, int dia, int medico, int unidade) async {
    try {
      var url = Uri.http("${connection.address}", '/horarios/medico/agendamento/');
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      http.Response resposta = await http.post(url,
          headers: headers,
          body: jsonEncode({"medico": medico, "unidade": unidade, "dia": dia, "data":data}),
          encoding: Encoding.getByName('utf-8'));

      var dados = json.decode(resposta.body);

      List<Horarios> lista = [];
 
      for (Map horario in dados) {
        lista.add(Horarios.fromMap(horario));
      }

      return lista;
    } catch (e) {
      return [];
    }
  }
}
