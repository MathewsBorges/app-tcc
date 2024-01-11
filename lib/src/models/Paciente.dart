import 'settings/PacientePropriedade.dart';
import 'settings/connection.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'Usuario.dart';

class Paciente extends Usuario {
  int codigo = 0;
  String cartaoSUS = "";

  Paciente(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone,
      endereco, cidade, email, senha, this.cartaoSUS)
      : super(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone,
            endereco, cidade, email, senha);

  void apresentar() {
    print(
        "Meu nome é $nome, $sobrenome, $dataNascimento, $cpf, $sexo, $telefone, $endereco, $cidade, $email, $senha, $cartaoSUS");
  }

  Paciente.fromMap(Map map) : super.fromMap(map) {
    codigo = map[PacientePropriedades.codigo];
    cartaoSUS = map[PacientePropriedades.cartao_sus];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = super.toMap(); // Chama o toMap() da classe pai
    map[PacientePropriedades.cartao_sus] =cartaoSUS; // Adiciona a propriedade cartao_sus
    return map;
  }

  static Future<List<Paciente>> carregarPacientes() async {
    try {
      var url = Uri.http("${connection.address}", '/paciente');
      http.Response resposta = await http.get(url);

      var dados = json.decode(resposta.body);
      List<Paciente> lista = [];

      for (Map paciente in dados) {
        lista.add(Paciente.fromMap(paciente));
      }

      return lista;
    } catch (e) {
      print('Erro desconhecido: $e');
      // Trate o erro conforme necessário
      return [];
    }
  }

  Future<int> inserirPaciente(Paciente paciente) async {
    var url = Uri.http("${connection.address}", '/paciente');
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';

    http.Response resposta = await http.post(url,
        headers: headers,
        body: jsonEncode(paciente.toMap()),
        encoding: Encoding.getByName('utf-8'));

    if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
      print('Inserção bem sucedida');
    } else {
      print('Deu ruim na inserção ${url.toString()} ${resposta.statusCode}');
    }
    return resposta.statusCode;
  }

  static Future<Paciente> login(email, senha) async {
    Paciente user =
        new Paciente(0, "", "", DateTime.now(), "", "", "", "", 1, "", "", "");
    var url = Uri.http("${connection.address}", '/paciente/login');
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';

    http.Response resposta = await http.post(url,
        headers: headers,
        body: jsonEncode({"email": email, "senha": senha}),
        encoding: Encoding.getByName('utf-8'));

    var dados = json.decode(resposta.body);
    List<Paciente> lista = [];

    for (Map paciente in dados) {
      lista.add(Paciente.fromMap(paciente));
    }

    return lista.isEmpty ? user : lista[0];
  }
}
