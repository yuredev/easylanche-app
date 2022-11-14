import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:equatable/equatable.dart';

abstract class AutenticacaoState {}

class UsuarioNaoLogadoState implements AutenticacaoState {}

class LogandoState implements AutenticacaoState {}

class DeslogandoState implements AutenticacaoState {}

class UsuarioLogadoState extends Equatable implements AutenticacaoState {
  final Usuario usuarioLogado;
  final String token;

  const UsuarioLogadoState(this.usuarioLogado, this.token);

  @override
  List<Object?> get props => [usuarioLogado];
}

class ErroAutenticadoState extends Equatable implements AutenticacaoState {
  final String mensagem;

  const ErroAutenticadoState(this.mensagem);

  @override
  List<Object?> get props => [mensagem];
}
