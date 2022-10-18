import 'package:dio/dio.dart';
import 'package:easylanche/data/models/dtos/cadastro_usuario_dto.dart';
import 'package:easylanche/data/repositories/usuario/usuario_logado_repository.dart';
import 'package:easylanche/data/repositories/usuario/usuario_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissaoUsuarioCubit extends Cubit<SubmissaoUsuarioState> {
  final AlertasAppCubit alertasAppCubit;
  final UsuarioRepository usuarioRepository;
  final UsuarioLogadoRepository usuarioLogadoRepository;

  SubmissaoUsuarioCubit({
    required this.alertasAppCubit,
    required this.usuarioRepository,
    required this.usuarioLogadoRepository,
  }) : super(InitialSubmissaoUsuarioState());

  Future<void> cadastrar(CadastroUsuarioDTOEnvio dto) async {
    try {
      emit(CadastrandoUsuarioState());
      final usuario = await usuarioRepository.cadastrar(dto);
      emit(UsuarioCadastradoState(usuario));
    } catch (e) {
      print(e);
      emit(ErroAoCadastrarUsuarioState());
      alertasAppCubit.notificar(
        e is DioError
            ? 'Erro de conexão ao se cadastrar'
            : 'Erro interno inesperado ao se cadastrar',
        isMensagemErro: true,
      );
    }
  }

  Future<void> remover(int idUsuario) async {
    try {
      emit(CadastrandoUsuarioState());
      await usuarioLogadoRepository.remover(idUsuario);
      emit(UsuarioRemovidoState(idUsuario));
    } catch (e) {
      print(e);
      emit(ErroAoRemoverUsuarioState(e is DioError));
      alertasAppCubit.notificar(
        e is DioError
            ? 'Erro de conexão ao remover conta'
            : 'Erro interno inesperado ao remover conta',
        isMensagemErro: true,
      );
    }
  }
}
