import 'package:saude/src/models/Agenda.dart';

class AgendaController {
  
  Future<List<Agenda>> getAgendamnetosByPaciente(id) async {

    List<Agenda> agenda = await Agenda.getAgendamentosByPaciente(id);
    return agenda;

  }
}
