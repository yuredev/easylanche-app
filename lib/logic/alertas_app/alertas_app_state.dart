abstract class AlertasAppState {}

class InitialAlertasAppState implements AlertasAppState {}

class AlertaSnackBarEmitidoState implements AlertasAppState {
  final String mensagem;
  final bool isMensagemErro;

  const AlertaSnackBarEmitidoState(this.mensagem, {this.isMensagemErro = false});
}
