import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/models/Unidade.dart';
import 'package:saude/src/pages/homePage.dart';
import 'package:saude/src/pages/medicosPage.dart';

class unidadesPage extends StatefulWidget {
  const unidadesPage({Key? key}) : super(key: key);
  static Unidade? unidade;
  @override
  State<unidadesPage> createState() => _unidadesPageState();
}

class _unidadesPageState extends State<unidadesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }

  appBar(context) {
    return AppBar(
      title: Text("Selecione o Local"),
    );
  }

  body(context) {
    return  FutureBuilder<List<Unidade>>(
              future: listarUnidades(home.paciente?.cidade.toString()),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print(snapshot);
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Não foi possível carregar as unidades'));
                } else {
                  List<Unidade>? unidades = snapshot.data;
                  print(unidades?[0].nome);
                  return ListView.builder(
                    itemCount: unidades?.length,
                    itemBuilder: (context, index) {
                      //Unidade? unidade = unidades?[index];
                      return unidadeCard(unidades![index]);
                    },
                  );
                }
              }));
    
  }

  static Future<List<Unidade>> listarUnidades(id) async {
    List<Unidade> unidades = await Unidade.listarUnidades(id);
  
    return unidades;
  }

  unidadeCard(Unidade unidade) {
    return GestureDetector(
      onTap: (){
          medicosPage.unidade = unidade;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => medicosPage()));
      },
      child: Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        margin: EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    "${unidade.nome}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.getFont('Outfit',
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                  ),
                ),
                IconButton(
                    onPressed: () => {
                          medicosPage.unidade = unidade,
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => medicosPage()))
                        },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 18,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    "${unidade.endereco}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.getFont('Outfit',
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700])),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    margin: EdgeInsets.all(4),
                    color: Color(0xff00acff),
                    shadowColor: Color(0xff000000),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255), width: 0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: Text(
                        "${unidade.tipo}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.getFont('Outfit',
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(4),
                    color: Color(0xff00d59e),
                    shadowColor: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: Text(
                        "${unidade.bairro}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.getFont('Outfit',
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
