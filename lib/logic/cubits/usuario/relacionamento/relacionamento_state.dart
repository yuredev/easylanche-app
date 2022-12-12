import 'package:equatable/equatable.dart';

abstract class RelacionamentoState {}

class InitialRelacionamentoState implements RelacionamentoState {}

class CarregandoSeguirUsuario implements RelacionamentoState {}

class UsuarioSeguidoSucessoState implements RelacionamentoState {}

class UsuarioParouDeSeguirSucessoState implements RelacionamentoState {}

class ErroSeguimentoUsuarioState implements RelacionamentoState {}

class ConsultandoUsuarioSeguidoState implements RelacionamentoState {}

class UsuarioSeguidoState extends Equatable implements RelacionamentoState {
  final bool isSeguido;

  const UsuarioSeguidoState(this.isSeguido);

  @override
  List<Object?> get props => [isSeguido];
}
