import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_cubit.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerContaWidget extends StatefulWidget {
  const DrawerContaWidget({Key? key}) : super(key: key);

  @override
  State<DrawerContaWidget> createState() => _DrawerContaWidgetState();
}

class _DrawerContaWidgetState extends State<DrawerContaWidget> {
  late final Usuario usuarioLogado;

  @override
  void initState() {
    super.initState();
    usuarioLogado =
        (context.read<AutenticacaoCubit>().state as UsuarioLogadoState)
            .usuarioLogado;
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AutenticacaoCubit>();
    final submissaoCubit = context.read<SubmissaoUsuarioCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: LayoutBuilder(
        builder: (context, constraints) => Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.grey[200],
                    height: constraints.maxHeight * 0.25,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxWidth * 0.45,
                          width: constraints.maxWidth * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Cores.laranjaPrincipal,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FittedBox(
                              child:
                                  const Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: BlocListener<AutenticacaoCubit,
                              AutenticacaoState>(
                            listener: (ctx, state) {},
                            child: Text(
                              usuarioLogado.nome,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 30),
                  child: BlocListener<SubmissaoUsuarioCubit,
                      SubmissaoUsuarioState>(
                    listener: (context, state) async {
                      if (state is UsuarioRemovidoState) {
                        Scaffold.of(context).closeEndDrawer();
                        await AlertUtils.mostrarDialogInformativo(
                          context,
                          texto: 'Sua conta foi removida!',
                          nomeImagem: 'vitoria.png',
                        );
                        authCubit.sair();
                      } else if (state is RemovendoUsuarioState) {
                        AlertUtils.mostrarCarregamento(
                          context,
                          texto: 'Removendo conta...',
                        );
                      } else if (state is ErroAoRemoverUsuarioState) {
                        Navigator.pop(context);
                      }
                    },
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        submissaoCubit.remover(usuarioLogado.id!);
                      },
                      child: const Text(
                        'Excluir conta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      authCubit.sair();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.logout,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Sair',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
