import 'package:dio/dio.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissaoOfertaCubit extends Cubit<SubmissaoOfertaState> {
  final AlertasAppCubit alertasAppCubit;
  final OfertaRepository ofertaRepository;
  final ListagemOfertaCubit listagemOfertaCubit;

  SubmissaoOfertaCubit({
    required this.alertasAppCubit,
    required this.ofertaRepository,
    required this.listagemOfertaCubit,
  }) : super(InitialOfertaState());

  Future<void> cadastrar(Oferta oferta) async {
    try {
      emit(CadastrandoOfertaState());
      await ofertaRepository.cadastrar(oferta);
      listagemOfertaCubit.listar();
      alertasAppCubit.notificar('Oferta cadastrada com sucesso!');
      emit(OfertaCadastradaState(oferta));
    } catch (e) {
      print(e);
      emit(ErroAoCadastrarOfertaState());
      alertasAppCubit.notificar(
        e is DioError
            ? 'Erro de conexão ao cadastrar a oferta'
            : 'Erro interno inesperado ao cadastrar oferta',
        isMensagemErro: true,
      );
    }
  }
}
