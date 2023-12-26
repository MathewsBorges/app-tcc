import 'package:saude/src/models/Medico.dart';

class MedicoController{

  Future<List<Medico>> listarMedicosPorUnidade(id)async{
    List<Medico> lista = await Medico.listarMedicosPorUnidade(id);
    return lista;

  }
}