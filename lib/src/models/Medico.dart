import 'package:saude/src/models/settings/MedicoPropriedade.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


import 'Usuario.dart';

class Medico extends Usuario{

int codigo = 0;
String crm ="";
String especialidade="";

  Medico(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone, endereco,
      cidade, email, senha, this.crm, this.especialidade): super(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone,
      endereco, cidade, email, senha);



  Medico.fromMap(Map map) : super.fromMap(map) {
    codigo = map[MedicoPropriedades.codigo];
    crm = map[MedicoPropriedades.crm];
    especialidade = map[MedicoPropriedades.especialidade];
  }

    
    static Future<List<Medico>> listarMedicosPorUnidade(String? id) async {
    try {

      var url = Uri.http("10.1.1.141:5000", '/medico/unidade/${id}');
      http.Response resposta = await http.get(url);

      var dados = json.decode(resposta.body);
      List<Medico> lista = [];

      for (Map medico in dados) {
        lista.add(Medico.fromMap(medico));
      }

      return lista;
    } catch (e) {
      print(e.toString());
      // Trate o erro conforme necessário
      return [];
    }
  }

}