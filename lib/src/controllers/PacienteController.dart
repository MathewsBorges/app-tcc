import '../models/Paciente.dart';

class PacienteController {

  Future<int> inserirPaciente(nome, sobrenome, dataNascimento, cpf, sexo,
      telefone, endereco, cidade, email, senha, cartaoSUS) async {

    Paciente paciente = new Paciente(0, nome, sobrenome, dataNascimento, cpf,
        sexo, telefone, endereco, cidade, email, senha, cartaoSUS);
    int status = await paciente.inserirPaciente(paciente);
    return status;

  }

Future<Paciente> login(email, senha)async{
  Paciente paciente = await Paciente.login(email,senha);
  return paciente;
}

}
