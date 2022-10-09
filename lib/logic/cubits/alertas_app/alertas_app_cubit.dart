import 'package:easylanche/logic/cubits/alertas_app/alertas_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertasAppCubit extends Cubit<AlertasAppState> {
  AlertasAppCubit() : super(InitialAlertasAppState());

  void notificar(String mensagem, {bool isMensagemErro = false}) {
    emit(AlertaSnackBarEmitidoState(mensagem, isMensagemErro: isMensagemErro));
  }
}
