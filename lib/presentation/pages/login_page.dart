// ignore_for_file: unnecessary_this

import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/presentation/widgets/shared/botao_elevado_widget.dart';
import 'package:easylanche/presentation/widgets/shared/campo_texto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = '';
  String cpf = '';
  String senha = '';
  String msgErro = '';
  bool carregando = false;
  bool logarComCpf = false;
  bool esconderSenha = true;
  FlutterSecureStorage storage = FlutterSecureStorage();

  final controladorInputLogin = TextEditingController();
  final mascaraCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  void initState() {
    super.initState();
  }

  void exibirLoading() {
    setState(() {
      msgErro = '';
      carregando = true;
    });
  }

  void removerLoading() {
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(0.0, -30.0, 0.0),
            child: Image.asset(
              'assets/images/barra_arredondada_login.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            transform: Matrix4.translationValues(0.0, -12.0, 0.0),
            child: Text(
              'EasyLanche',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 36, bottom: 3),
          child: Text(
            'Entrar',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 37, bottom: 40),
          child: Text(
            'Bem vindo de volta',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 35, right: 36),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: CampoTextoWidget(
                  mascara: logarComCpf ? mascaraCpf : null,
                  icone: Icon(Icons.person, size: 20),
                  aoAlterar: (valor) {
                    setState(() {
                      if (logarComCpf) {
                        cpf = valor;
                      } else {
                        login = valor;
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: CampoTextoWidget(
                  mascara: logarComCpf ? mascaraCpf : null,
                  icone: Icon(Icons.person, size: 20),
                  aoAlterar: (valor) {
                    setState(() {
                      if (logarComCpf) {
                        cpf = valor;
                      } else {
                        login = valor;
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: BotaoElevadoWidget(
                  nome: 'Entrar',
                  cor: Cores.laranjaPrincipal,
                  corTexto: Colors.white,
                  largura: double.infinity,
                  altura: 45,
                ),
              ),
              msgErro != ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                          child: Text(
                        msgErro,
                        style: TextStyle(color: Colors.red),
                      )),
                    )
                  : SizedBox(),
              carregando
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                          )),
                    )
                  : SizedBox(),
            ])),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Desenvolvido pelo TADS',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Cores.textField,
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
