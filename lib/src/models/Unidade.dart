

import 'package:saude/src/models/settings/UnidadePropriedade.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:saude/src/pages/unidadesPage.dart';

class Unidade{
  int codigo = 0;
  String nome = "";
  String endereco = "";
  String telefone = "";
  String bairro="";
  int cidade=0;
  String tipo="";

  Unidade(this.codigo, this.nome, this.endereco, this.telefone,this.bairro, this.cidade, this.tipo);

    Unidade.fromMap(Map map) {
    codigo = map[UnidadePropriedades.codigo];
    nome = map[UnidadePropriedades.nome];
    endereco = map[UnidadePropriedades.endereco];
    telefone = map[UnidadePropriedades.telefone];
    bairro = map[UnidadePropriedades.bairro];
    cidade = map[UnidadePropriedades.cidade];
    tipo = map[UnidadePropriedades.tipo];
   
  }
  

  static Future<List<Unidade>> listarUnidades(String? id) async {
    try {
      var url = Uri.http("10.1.1.141:5000", '/unidades/${id}',);
      http.Response resposta = await http.get(url);

      var dados = json.decode(resposta.body);
      List<Unidade> lista = [];

      for (Map unidade in dados) {
        lista.add(Unidade.fromMap(unidade));
      }

      return lista;
    } catch (e) {
      print('Erro desconhecido: $e');
      // Trate o erro conforme necessário
      return [];
    }
  }


}