import 'Unidade.dart';
import 'Usuario.dart';

class Coordenadoria extends Usuario{

  Unidade unidade;
  
  Coordenadoria(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone, endereco,
      cidade, email, senha, this.unidade)
      : super(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone,
            endereco, cidade, email, senha);



}