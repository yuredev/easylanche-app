import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListagemOfertaCubit extends Cubit<ListagemOfertaState> {
  OfertaRepository ofertaRepository;

  ListagemOfertaCubit({
    required this.ofertaRepository,
  }) : super(InitialListagemOfertaState());

  Future<void> listar() async {
    try {
      emit(ListandoOfertasState());
      final ofertas = await ofertaRepository.listar();
      await Future.delayed(Duration(milliseconds: 500));
      emit(OfertasListadasState(ofertas));
    } catch (e) {
      print(e);
      emit(ErroAoListarOfertasState(e.toString()));
    }
  }
}
