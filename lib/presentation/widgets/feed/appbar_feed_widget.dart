import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarFeedWidget extends StatelessWidget {
  const AppBarFeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4, right: 4),
          child: const Icon(Icons.fastfood, size: 32),
        ),
        const Text(
          'EasyLanche',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Cores.laranjaPrincipal,
            borderRadius: BorderRadius.circular(70),
          ),
          child: Material(
            color: Colors.transparent,
            child: Builder(
              builder: (ctx) =>
                  BlocBuilder<AutenticacaoCubit, AutenticacaoState>(
                builder: (context, state) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(70),
                    onTap: () {
                      if (state is UsuarioNaoLogadoState) {
                        Navigator.pushNamed(context, Rotas.login);
                      } else if (state is UsuarioLogadoState) {
                        Scaffold.of(ctx).openEndDrawer();
                      }
                    },
                    child: state is UsuarioNaoLogadoState
                        ? Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.login,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
