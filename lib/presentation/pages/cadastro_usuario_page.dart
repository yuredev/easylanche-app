// TODO: criar validações para os campos
import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/dtos/cadastro_usuario_dto.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_cubit.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_state.dart';
import 'package:easylanche/presentation/widgets/shared/botao_elevado_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/constants/cores.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({Key? key}) : super(key: key);

  @override
  State<CadastroUsuarioPage> createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  var possuiErroForm = false;
  var isSenhaOculta = true;
  String? senha;
  String? nomeUsuario;
  String? nome;
  String? telefone = '5584';
  String? confirmacaoSenha;
  final mascaraTelefone = MaskTextInputFormatter(
    mask: '#############',
    filter: {
      "#": RegExp(
        r'^[0-9]+$',
      )
    },
  );

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
                              'Cadastrar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.5, top: 30),
                          child: TextFormField(
                            onFieldSubmitted: (_) {},
                            autocorrect: false,
                            autofocus: false,
                            onChanged: (valor) {
                              setState(() => nome = valor);
                            },
                            textCapitalization: TextCapitalization.none,
                            style: const TextStyle(
                              color: Cores.textField,
                              fontSize: 16,
                            ),
                            enableSuggestions: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: const Icon(Icons.person, size: 20),
                              labelText: 'Nome',
                              contentPadding: const EdgeInsets.only(
                                left: 22,
                                top: 16,
                                bottom: 16,
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.5),
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: const Icon(Icons.person, size: 20),
                              labelText: 'Nome de usuário',
                              contentPadding: const EdgeInsets.only(
                                left: 22,
                                top: 16,
                                bottom: 16,
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.5),
                          child: TextFormField(
                            onFieldSubmitted: (_) {},
                            autocorrect: false,
                            autofocus: false,
                            inputFormatters: [mascaraTelefone],
                            onChanged: (valor) {
                              setState(() {
                                telefone = valor;
                              });
                            },
                            textCapitalization: TextCapitalization.none,
                            style: const TextStyle(
                              color: Cores.textField,
                              fontSize: 16,
                            ),
                            enableSuggestions: false,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: const Icon(Icons.phone, size: 20),
                              labelText: 'Telefone',
                              contentPadding: const EdgeInsets.only(
                                left: 22,
                                top: 16,
                                bottom: 16,
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.5),
                          child: TextFormField(
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isSenhaOculta
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(
                                      () => isSenhaOculta = !isSenhaOculta);
                                },
                              ),
                              labelText: 'Senha',
                              contentPadding: const EdgeInsets.only(
                                left: 22,
                                top: 16,
                                bottom: 16,
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
                              confirmacaoSenha = valor;
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
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
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
                            labelText: 'Confirmar senha',
                            contentPadding: const EdgeInsets.only(
                              left: 22,
                              top: 16,
                              bottom: 16,
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
                        BlocConsumer<SubmissaoUsuarioCubit,
                            SubmissaoUsuarioState>(
                          listener: (ctx, state) {
                            if (state is UsuarioCadastradoState) {
                              Navigator.pop(context);
                              AlertUtils.mostrarDialogInformativo(
                                context,
                                texto: 'Cadastro realizado com sucesso!',
                                nomeImagem: 'vitoria.png',
                              );
                            } else if (state is ErroAoCadastrarUsuarioState) {
                              AlertUtils.mostrarSnackBar(
                                context,
                                'Erro ao se cadastrar!',
                              );
                            }
                          },
                          builder: (ctx, state) {
                            return Container(
                              margin: const EdgeInsets.only(top: 24),
                              child: BotaoElevadoWidget(
                                largura: double.infinity,
                                nome: 'Submeter',
                                textoCarregamento: 'Submetendo...',
                                raioBorda: 50,
                                cor: Cores.laranjaPrincipal,
                                isCarregando: state is CadastrandoUsuarioState,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                altura: 45,
                                corTexto: Colors.white,
                                aoPressionar: () {
                                  context
                                      .read<SubmissaoUsuarioCubit>()
                                      .cadastrar(
                                        CadastroUsuarioDTOEnvio(
                                          nome: nome!,
                                          telefone: telefone!,
                                          nomeUsuario: nomeUsuario!,
                                          papel: 'USUARIO',
                                          senha: senha!,
                                        ),
                                      );
                                },
                              ),
                            );
                          },
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
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Já possui conta?',
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
