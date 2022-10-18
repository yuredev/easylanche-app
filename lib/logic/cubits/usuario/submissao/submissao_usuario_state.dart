import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:equatable/equatable.dart';

abstract class SubmissaoUsuarioState {}

class InitialSubmissaoUsuarioState implements SubmissaoUsuarioState {}

class CadastrandoUsuarioState implements SubmissaoUsuarioState {}

class UsuarioCadastradoState extends Equatable
    implements SubmissaoUsuarioState {
  final Usuario usuario;

  const UsuarioCadastradoState(this.usuario);

  @override
  List<Object?> get props => [usuario];
}

class ErroAoCadastrarUsuarioState extends Equatable
    implements SubmissaoUsuarioState {
  final bool isErroConexao;

  const ErroAoCadastrarUsuarioState({this.isErroConexao = false});

  @override
  List<Object?> get props => [isErroConexao];
}

class RemovendoUsuarioState implements SubmissaoUsuarioState {}

class UsuarioRemovidoState extends Equatable implements SubmissaoUsuarioState {
  final int idUsuario;

  const UsuarioRemovidoState(this.idUsuario);

  @override
  List<Object?> get props => [idUsuario];
}

class ErroAoRemoverUsuarioState extends Equatable implements SubmissaoUsuarioState {
  final bool isErroConexao;

  const ErroAoRemoverUsuarioState(this.isErroConexao);
  
  @override
  List<Object?> get props => [isErroConexao];
}
