import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:equatable/equatable.dart';

abstract class SubmissaoOfertaState {}

class InitialOfertaState implements SubmissaoOfertaState {}

class CadastrandoOfertaState implements SubmissaoOfertaState {}

class OfertaCadastradaState extends Equatable implements SubmissaoOfertaState {
  final Oferta oferta;

  const OfertaCadastradaState(this.oferta);

  @override
  List<Object?> get props => [oferta];
}

class ErroAoCadastrarOfertaState extends Equatable implements SubmissaoOfertaState {
  final bool isErroConexao;

  const ErroAoCadastrarOfertaState({this.isErroConexao = false});
  
  @override
  List<Object?> get props => [isErroConexao];
}
