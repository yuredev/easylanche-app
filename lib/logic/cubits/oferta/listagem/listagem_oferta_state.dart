import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:equatable/equatable.dart';

abstract class ListagemOfertaState {}

class InitialListagemOfertaState  implements ListagemOfertaState {}

class ListandoOfertasState implements ListagemOfertaState {}

class OfertasListadasState extends Equatable implements ListagemOfertaState {
  final List<Oferta> ofertas;

  const OfertasListadasState(this.ofertas);
  
  @override
  List<Object?> get props => [ofertas];
}

class ErroAoListarOfertasState extends Equatable  implements ListagemOfertaState {
  final String mensagemErro;

  const ErroAoListarOfertasState(this.mensagemErro);

  @override
  List<Object?> get props => [mensagemErro];
}
