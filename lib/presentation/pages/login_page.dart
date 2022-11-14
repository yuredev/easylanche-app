import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/autenticacao/autenticacao.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/presentation/widgets/shared/botao_elevado_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var possuiErroForm = false;
  var isSenhaOculta = true;
  String nomeUsuario = '';
  String senha = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isTecladoAberto = MediaQuery.of(context).viewInsets.bottom > 0;
    final double margemSuperior;

    if (isTecladoAberto) {
      margemSuperior = possuiErroForm ? 20 : 50;
    } else {
      margemSuperior = 100;
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Cores.cinzaBackground,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: margemSuperior,
                    bottom: 60,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message: 'Voltar',
                        child: SizedBox(
                          width: 40,
                          child: Material(
                            color: Colors.transparent,
                            child: FittedBox(
                              child: IconButton(
                                splashRadius: 25,
                                color: Colors.grey,
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(context),
                                iconSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'EasyLanche',
                        style: TextStyle(
                          fontSize: 45,
                          color: Cores.laranjaPrincipal,
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: constraints.maxHeight / 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 35,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Entrar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.5, top: 30),
                          child: TextFormField(
                            onFieldSubmitted: (_) {},
                            autocorrect: false,
                            autofocus: false,
                            onChanged: (valor) {
                              setState(() {
                                nomeUsuario = valor;
                              });
                            },
                            textCapitalization: TextCapitalization.none,
                            style: const TextStyle(
                              color: Cores.textField,
                              fontSize: 16,
                            ),
                            enableSuggestions: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person, size: 20),
                              labelText: 'Usuário',
                              contentPadding: const EdgeInsets.only(
                                left: 22,
                                top: 16,
                                bottom: 16,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 5,
                                  style: BorderStyle.solid,
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              labelStyle: TextStyle(color: Cores.textField),
                              isDense: true,
                            ),
                          ),
                        ),
                        TextFormField(
                          onFieldSubmitted: (_) {},
                          autocorrect: false,
                          autofocus: false,
                          onChanged: (valor) {
                            setState(() {
                              senha = valor;
                            });
                          },
                          textCapitalization: TextCapitalization.none,
                          style: const TextStyle(
                            color: Cores.textField,
                            fontSize: 16,
                          ),
                          enableSuggestions: false,
                          textInputAction: TextInputAction.next,
                          obscureText: isSenhaOculta,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                isSenhaOculta
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() => isSenhaOculta = !isSenhaOculta);
                              },
                            ),
                            labelText: 'Senha',
                            contentPadding: const EdgeInsets.only(
                              left: 22,
                              top: 16,
                              bottom: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 5,
                                style: BorderStyle.solid,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelStyle: TextStyle(color: Cores.textField),
                            isDense: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: BlocConsumer<AutenticacaoCubit,
                              AutenticacaoState>(
                            listener: (ctx, state) {
                              if (state is UsuarioLogadoState) {
                                Navigator.pushReplacementNamed(
                                    context, Rotas.feed);
                              } else if (state is ErroAutenticadoState) {
                                AlertUtils.mostrarSnackBar(
                                  context,
                                  'Credenciais inválidas!',
                                  isMensagemErro: true,
                                );
                              }
                            },
                            builder: (context, state) => BotaoElevadoWidget(
                              largura: double.infinity,
                              nome: 'Entrar',
                              raioBorda: 50,
                              cor: Cores.laranjaPrincipal,
                              altura: 45,
                              corTexto: Colors.white,
                              isCarregando: state is LogandoState,
                              aoPressionar: () {
                                context.read<AutenticacaoCubit>().autenticar(
                                      RequisicaoAuthDTO(nomeUsuario, senha),
                                    );
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2, right: 6),
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              Rotas.cadastroUsuario,
                            ),
                            child: Text(
                              'Não possui conta?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 80),
                          height: 20,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text('Desenvolvido pelo TADS'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
