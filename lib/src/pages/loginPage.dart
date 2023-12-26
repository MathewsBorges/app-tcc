import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:saude/src/controllers/PacienteController.dart';
import 'package:saude/src/models/Paciente.dart';
import 'package:saude/src/pages/homePage.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

PacienteController controller = new PacienteController();

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _senhaLogin = TextEditingController();
  final TextEditingController _nomeCadastro = TextEditingController();
  final TextEditingController _sobrenomeCadastro = TextEditingController();
  final TextEditingController _dataCadastro = TextEditingController();
  final TextEditingController _cpfCadastro = TextEditingController();
  final TextEditingController _cartaoCadastro = TextEditingController();
  final TextEditingController _telefoneCadastro = TextEditingController();
  final TextEditingController _enderecoCadastro = TextEditingController();

  final TextEditingController _emailCadastro = TextEditingController();
  final TextEditingController _senhaCadastro = TextEditingController();

  String _sexoCadastro = "M";
  String _cidadeCadastro = 'Selecione sua cidade';
  late bool loginVisibility;

  @override
  void initState() {
    loginVisibility = false;
    super.initState();
  }

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskData = MaskTextInputFormatter(
      mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
  final maskTelefone = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskCartao = MaskTextInputFormatter(
      mask: "### ##### #### ####", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "+Saúde",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.getFont('Outfit',
                          textStyle: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "NÓS CUIDAMOS DE VOCÊ",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.getFont('Outfit',
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Colors.cyan[700],
                          unselectedLabelColor: Colors.grey[400],
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          labelStyle: GoogleFonts.getFont('Outfit',
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2)),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor: Colors.cyan[700],
                          indicatorWeight: 2,
                          tabs: <Widget>[
                            Tab(
                              text: 'Login',
                            ),
                            Tab(
                              text: 'Cadastrar',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height -
                            200, // Adjust height accordingly
                        child: TabBarView(
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: TextField(
                                      controller: _emailLogin,
                                      obscureText: false,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                      decoration: InputDecoration(
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        labelText: "Email",
                                        labelStyle: GoogleFonts.getFont(
                                            'Outfit',
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                        hintText: "Informe o email",
                                        hintStyle: GoogleFonts.getFont('Outfit',
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                        filled: true,
                                        fillColor: Color(0xfff1f4f7),
                                        isDense: false,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 20),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 16, 16, 20),
                                    child: TextField(
                                      controller: _senhaLogin,
                                      obscureText: true,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                      decoration: InputDecoration(
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1),
                                        ),
                                        labelText: "Senha",
                                        labelStyle: GoogleFonts.getFont(
                                            'Outfit',
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                        hintText: "Informe sua Senha ",
                                        hintStyle: GoogleFonts.getFont('Outfit',
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                        filled: true,
                                        fillColor: Color(0xfff1f3f7),
                                        isDense: false,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 20),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(50, 16, 50, 0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        login(context);
                                      },
                                      color: Color(0xff01978b),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.getFont('Outfit',
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ),
                                      textColor: Color(0xffffffff),
                                      height: 50,
                                      minWidth: 230,
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xffffffff),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 1),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "Esqueceu a senha? ",
                                      style: GoogleFonts.getFont('Outfit',
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ),
                                    textColor: Color(0xff000000),
                                    height: 40,
                                    minWidth: 140,
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 20, 25, 8),
                                      child: TextField(
                                        controller: _nomeCadastro,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('Nome',
                                            'Informe seu primeiro nome'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _sobrenomeCadastro,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('Sobrenome',
                                            'Informe seu sobrenome'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _dataCadastro,
                                        inputFormatters: [maskData],
                                        keyboardType: TextInputType.datetime,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('Data de Nascimento',
                                            'Informe sua data de nascimento'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _cpfCadastro,
                                        inputFormatters: [maskCpf],
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration:
                                            design('CPF', 'Informe seu cpf'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _cartaoCadastro,
                                        inputFormatters: [maskCartao],
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('N° Cartão SUS',
                                            'Informe o seu cartão SUS'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _enderecoCadastro,
                                        keyboardType: TextInputType.phone,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('Endereço',
                                            'Informe seu endereço completo'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _telefoneCadastro,
                                        inputFormatters: [maskTelefone],
                                        keyboardType: TextInputType.phone,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design('Telefone',
                                            'Informe seu número para contato'),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 16),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioListTile(
                                                  title: Text('Masculino'),
                                                  value: 'M',
                                                  groupValue: _sexoCadastro,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _sexoCadastro =
                                                          value as String;
                                                    });
                                                  }),
                                              RadioListTile(
                                                  title: Text('Feminino'),
                                                  value: 'F',
                                                  groupValue: _sexoCadastro,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _sexoCadastro =
                                                          value as String;
                                                    });
                                                  })
                                            ])),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width -
                                                  50,
                                          height: 70,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xfff1f4f8),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              value: _cidadeCadastro,
                                              items: [
                                                "Selecione sua cidade",
                                                "Camaquã-RS"
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  _cidadeCadastro =
                                                      value as String;
                                                  print(_cidadeCadastro);
                                                });
                                              },
                                              elevation: 8,
                                              isExpanded: true,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 8),
                                      child: TextField(
                                        controller: _emailCadastro,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: design(
                                            'Email', 'Informe seu email'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 20),
                                      child: TextFormField(
                                        controller: _senhaCadastro,
                                        obscureText: !loginVisibility,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: designSenha('Senha',
                                            'Informe seu senha para acesso'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 100),
                                      child: MaterialButton(
                                        onPressed: () async {
                                          int status = await cadastrar(context);
                                          if (status == 200) {
                                            clear();
                                            final snackBar = SnackBar(
                                              /// need to set following properties for best effect of awesome_snackbar_content
                                              elevation: 0,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                title:
                                                    'Cadastro Realizado com Sucesso',
                                                message:
                                                    'Seu cadastro foi realizado com sucesso, retorne ao login para acessar',

                                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                          } else {
                                            final snackBar = SnackBar(
                                              /// need to set following properties for best effect of awesome_snackbar_content
                                              elevation: 0,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                title: 'Algo deu errado!',
                                                message:
                                                    'Não foi possivel realizar o cadastro',

                                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                contentType:
                                                    ContentType.failure,
                                              ),
                                            );
                                          }
                                        },
                                        color: Color(0xff01978b),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          "Criar Conta",
                                          style: GoogleFonts.getFont('Outfit',
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white)),
                                        ),
                                        textColor: Color(0xffffffff),
                                        height: 50,
                                        minWidth: 230,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  cadastrar(context) async {
    List<String> cidades = ["Não Encontrada", "Camaquã-RS"];
    String nome = _nomeCadastro.text;
    String sobrenome = _sobrenomeCadastro.text;
    String cpf = _cpfCadastro.text;
    String cartaoSUS = _cartaoCadastro.text;
    String telefone = _telefoneCadastro.text;
    String endereco = _enderecoCadastro.text;
    DateTime data = DateTime.parse(converterData(_dataCadastro.text));
    String sexo = _sexoCadastro;
    int cidade = cidades.indexOf(_cidadeCadastro);
    String email = _emailCadastro.text;
    String senha = _senhaCadastro.text;

    int status = await controller.inserirPaciente(nome, sobrenome, data, cpf,
        sexo, telefone, endereco, cidade, email, senha, cartaoSUS);
    return status;
  }

  clear() {
    _nomeCadastro.clear();
    _sobrenomeCadastro.clear;
    _cpfCadastro.clear();
    _cartaoCadastro.clear();
    _telefoneCadastro.clear();
    _enderecoCadastro.clear();
    _dataCadastro.clear();
    _cidadeCadastro = "Selecione sua cidade";
    _emailCadastro.clear();
    _senhaCadastro.clear();
  }

  login(context) async {
    String email = _emailLogin.text;
    String senha = _senhaLogin.text;
    if (email.isEmpty || senha.isEmpty) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Espere um pouco...',
          message:
              'Você deve informar seu Email e Senha para entrar no aplicativo',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.help,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      Paciente paciente = await controller.login(email, senha);
      home.paciente = paciente;
      if (paciente.codigo != 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else {
            final snackBar = SnackBar(
           elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Dados Inválidos',
          message:
              'Email ou senha incorretos',

          contentType: ContentType.failure,
        ),
      );
        ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      }
    }
  }

  String converterData(String dataOriginal) {
    List<String> partes = dataOriginal.split('/');
    if (partes.length == 3) {
      String ano = partes[2];
      String mes = partes[1];
      String dia = partes[0];

      // Adiciona zeros à esquerda, se necessário
      if (mes.length == 1) {
        mes = '0$mes';
      }
      if (dia.length == 1) {
        dia = '0$dia';
      }

      return '$ano-$mes-$dia';
    } else {
      // Trate o formato incorreto ou retorne um valor padrão
      return 'Formato de data inválido';
    }
  }

  design(label, hint, {tipo = 1}) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      labelText: label,
      labelStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      hintText: hint,
      hintStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      filled: true,
      fillColor: Color(0xfff1f3f7),
      isDense: false,
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
    );
  }

  designSenha(label, hint) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0x00000000), width: 1),
      ),
      labelText: label,
      labelStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      hintText: hint,
      hintStyle: GoogleFonts.getFont('Outfit',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
      filled: true,
      fillColor: Color(0xfff1f3f7),
      isDense: false,
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      suffixIcon: InkWell(
        onTap: () => setState(
          () => loginVisibility = !loginVisibility,
        ),
        focusNode: FocusNode(skipTraversal: true),
        child: Icon(
          loginVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: const Color.fromARGB(255, 92, 92, 92),
          size: 22,
        ),
      ),
    );
  }
}
