import 'package:dio/dio.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissaoOfertaCubit extends Cubit<SubmissaoOfertaState> {
  final AlertasAppCubit alertasAppCubit;
  final OfertaRepository ofertaRepository;
  final ListagemOfertaCubit listagemOfertaCubit;
  final AutenticacaoCubit autenticacaoCubit;

  SubmissaoOfertaCubit({
    required this.alertasAppCubit,
    required this.ofertaRepository,
    required this.listagemOfertaCubit,
    required this.autenticacaoCubit,
  }) : super(InitialOfertaState());

  Future<void> salvar(Oferta oferta, bool isEdicao) async {
    try {
      emit(CadastrandoOfertaState());
      final idUsuarioLogado =
          (autenticacaoCubit.state as UsuarioLogadoState).usuarioLogado.id;
      
      if (isEdicao) {
        // TODO: ajeitar rota
        // await ofertaRepository.atualizar(oferta.id!, oferta);
        await ofertaRepository.remover(oferta.id!);
        await ofertaRepository.cadastrar(idUsuarioLogado!, oferta);
      } else {
        await ofertaRepository.cadastrar(idUsuarioLogado!, oferta);
      }
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
