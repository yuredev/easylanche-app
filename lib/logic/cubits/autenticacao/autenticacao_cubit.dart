import 'package:dio/dio.dart';
import 'package:easylanche/data/models/autenticacao/autenticacao.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:easylanche/data/repositories/autenticacao/remote/remote_autenticacao_repository.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_state.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutenticacaoCubit extends Cubit<AutenticacaoState> {
  final RemoteAutenticacaoRepository autenticacaoRepository;
  final AutenticadoLocalRepository localAutenticadoRepository;
  final AlertasAppCubit alertasAppCubit;

  AutenticacaoCubit({
    required this.autenticacaoRepository,
    required this.localAutenticadoRepository,
    required this.alertasAppCubit,
  }) : super(UsuarioNaoLogadoState());

  Future<void> ensureInitialized() async {
    final usuario = await localAutenticadoRepository.buscarUsuario();
    final token = await localAutenticadoRepository.buscarToken();
    if (usuario != null && token != null) {
      emit(UsuarioLogadoState(usuario, token));
    }
  }

  void autenticar(RequisicaoAuthDTO authDTO) async {
    try {
      emit(LogandoState());
      final resposta = await autenticacaoRepository.autenticar(authDTO);
      await localAutenticadoRepository.salvar(resposta.usuario, resposta.token);
      alertasAppCubit.notificar('Bem vindo ${resposta.usuario.nome}!');
      emit(UsuarioLogadoState(resposta.usuario, resposta.token));
    } catch (e) {
      print(e);
      late String mensagemErro;
      if (e is DioError) {
        mensagemErro =
            e.response!.statusCode == 403 || e.response!.statusCode == 401
                ? 'Usuário ou senha inválidos'
                : 'Erro durante conexão com o servidor, tente novamente.';
      } else {
        mensagemErro = 'Erro interno inesperado ao tentar se autenticar';
      }
      emit(ErroAutenticadoState(mensagemErro));
    }
  }

  void sair({bool exibirMensagem = true}) async {
    final _state = (state as UsuarioLogadoState);
    try {
      emit(DeslogandoState());
      await localAutenticadoRepository.limparCredenciais();
      emit(UsuarioNaoLogadoState());
      if (exibirMensagem) {
        alertasAppCubit.emit(AlertaSnackBarEmitidoState('Você saiu'));
      }
    } catch (e) {
      print(e);
      alertasAppCubit.notificar(
        'Não foi possível sair, tente novamente.',
        isMensagemErro: true,
      );
      emit(UsuarioLogadoState(_state.usuarioLogado, _state.token));
    }
  }

  Usuario? get usuarioAutenticado {
    if (state is UsuarioLogadoState) {
      return (state as UsuarioLogadoState).usuarioLogado;
    } else {
      return null;
    }
  }

  String? get token {
    if (state is UsuarioLogadoState) {
      return (state as UsuarioLogadoState).token;
    } else {
      return null;
    }
  }
}
