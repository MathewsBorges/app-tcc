import 'settings/UsuarioPropriedade.dart';
import 'settings/PacientePropriedade.dart';
import 'package:intl/intl.dart';
class Usuario {
  int codigo = 0;
  String nome = "";
  String sobrenome = "";
  DateTime dataNascimento = DateTime.parse("2001-01-01");
  String cpf = "000.000.000-00";
  String sexo = "";
  String telefone = "";
  String endereco = "";
  int cidade = 0;
  String email = "";
  String senha = "";
  int status = 1;



  Usuario(this.codigo, this.nome, this.sobrenome,this.dataNascimento, this.cpf, this.sexo,
          this.telefone,this.endereco, this.cidade, this.email, this.senha);
 
    Usuario.fromMap(Map map) {
    codigo = map[UsuarioPropriedades.codigo];
    nome = map[UsuarioPropriedades.nome];
    sobrenome = map[UsuarioPropriedades.sobrenome];
    dataNascimento = DateTime.parse(map[UsuarioPropriedades.data_nascimento]);
    cpf = map[UsuarioPropriedades.cpf];
    sexo = map[UsuarioPropriedades.sexo];
    telefone = map[UsuarioPropriedades.telefone];
    endereco = map[UsuarioPropriedades.endereco]!= null ?map[UsuarioPropriedades.endereco] :'teste' ;
    cidade = map[UsuarioPropriedades.cidade];
    email = map[UsuarioPropriedades.email];
    senha = map[UsuarioPropriedades.senha];
  }

  Map<String, Object> toMap() {

    Map<String, Object> map = {
      UsuarioPropriedades.codigo: codigo,
      UsuarioPropriedades.nome: nome,
      UsuarioPropriedades.sobrenome: sobrenome,
      UsuarioPropriedades.data_nascimento: dataNascimento.toString(),
      UsuarioPropriedades.cpf: cpf,
      UsuarioPropriedades.sexo: sexo,
      UsuarioPropriedades.telefone: telefone,
      UsuarioPropriedades.endereco: endereco,
      UsuarioPropriedades.cidade: cidade,
      UsuarioPropriedades.email: email,
      UsuarioPropriedades.senha: senha,
   
    };
    return map;
}



}
