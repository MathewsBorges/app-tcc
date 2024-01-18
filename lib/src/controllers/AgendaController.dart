import 'package:saude/src/models/Agenda.dart';

class AgendaController {
  
  Future<List<Agenda>> getAgendamnetosByPaciente(id) async {

    List<Agenda> agenda = await Agenda.getAgendamentosByPaciente(id);
    return agenda;

  }

  Future<int> agendar (data, horario, paciente) async{
    int status = await Agenda.agendarConsulta(data, horario, paciente);
    return status;
  } 

  Future<int> remover (id) async{
    int status = await Agenda.removerConsulta(id);
    return status;
  }
 }
