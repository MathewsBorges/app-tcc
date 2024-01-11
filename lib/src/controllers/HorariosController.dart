import 'package:saude/src/models/Horarios.dart';

class HorariosController{

  Future<List<int>> listarDias(id, unidade)async{
    List<int> lista = await Horarios.listarDiasMedico(id, unidade);
    return lista;
  }

   Future<List<Horarios>> listarHorariosDisponiveis(medico, unidade, data, dia)async{
    String dataFormatada = convertDate(data);
    List<Horarios> lista = await Horarios.listarHorariosMedico(dataFormatada, dia, medico, unidade);
    return lista;
  }



String convertDate(String inputDate) {

  List<String> parts = inputDate.split('/');
  String outputDate = "${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}";
  
  return outputDate;
}
  
}