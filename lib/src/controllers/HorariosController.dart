import 'package:saude/src/models/Horarios.dart';

class HorariosController{

  Future<List<int>> listarDias(id, unidade)async{
    List<int> lista = await Horarios.listarDiasMedico(id, unidade);
    return lista;
  }

  
}