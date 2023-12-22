import 'Especialidade.dart';
import 'Usuario.dart';

class Medico extends Usuario{

String crm;
Especialidade especialidade;

  Medico(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone, endereco,
      cidade, email, senha, this.crm, this.especialidade): super(codigo, nome, sobrenome, dataNascimento, cpf, sexo, telefone,
      endereco, cidade, email, senha);
}