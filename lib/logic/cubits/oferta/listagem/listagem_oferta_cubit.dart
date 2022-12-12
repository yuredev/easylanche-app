import 'package:dio/dio.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListagemOfertaCubit extends Cubit<ListagemOfertaState> {
  OfertaRepository ofertaRepository;
  AutenticacaoCubit autenticacaoCubit;

  ListagemOfertaCubit({
    required this.ofertaRepository,
    required this.autenticacaoCubit,
  }) : super(InitialListagemOfertaState());

  Future<void> listar() async {
    try {
      emit(ListandoOfertasState());
      final prefs = await SharedPreferences.getInstance();
      final ofertasBuscadas = await ofertaRepository.listar();
      if (autenticacaoCubit.state is UsuarioLogadoState) {
        final idsUsuariosSeguidos = prefs.getStringList('seguidos') ?? [];

        final ofertasSeguidas = ofertasBuscadas.where(
            (o) => idsUsuariosSeguidos.contains(o.usuario?.id.toString()));
        final ofertasNaoSeguidas =
            ofertasBuscadas.where((o) => !ofertasSeguidas.contains(o));
        final ofertas = [...ofertasSeguidas, ...ofertasNaoSeguidas];
        emit(OfertasListadasState(ofertas));
      } else {
        emit(OfertasListadasState(ofertasBuscadas));
      }
    } catch (e) {
      print(e);
      emit(ErroAoListarOfertasState(e is DioError));
    }
  }
}
