import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AlertasAppHandler extends StatelessWidget {
  final Widget? child;

  const AlertasAppHandler({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I.get<AlertasAppCubit>(),
      child: BlocListener<AlertasAppCubit, AlertasAppState>(
        listenWhen: (_, state) {
          return state is AlertaSnackBarEmitidoState;
        },
        listener: (ctx, state) {
          AlertUtils.mostrarSnackBar(
            ctx,
            (state as AlertaSnackBarEmitidoState).mensagem,
            isMensagemErro: state.isMensagemErro,
            fecharAtual: true,
          );
        },
        child: child,
      ),
    );
  }
}
