import 'package:dio/dio.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissaoOfertaCubit extends Cubit<SubmissaoOfertaState> {
  final AlertasAppCubit alertasAppCubit;

  SubmissaoOfertaCubit({required this.alertasAppCubit})
      : super(InitialOfertaState());

  Future<void> cadastrar(Oferta oferta) async {
    try {
      emit(CadastrandoOfertaState());
      await Future.delayed(Duration(seconds: 2));
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
