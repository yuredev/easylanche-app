import 'package:easylanche/core/ambiente.dart';
import 'package:easylanche/data/repositories/autenticacao/remote/remote_autenticacao_repository.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/data/repositories/usuario/usuario_logado_repository.dart';
import 'package:easylanche/data/repositories/usuario/usuario_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class Instancias {
  static GetIt get it => GetIt.I;

  static Future<void> inicializar(
      ConfiguracaoAmbiente configuracaoAmbiente) async {
    it.registerLazySingleton(() => AlertasAppCubit());
    it.registerLazySingleton(
        () => RemoteAutenticacaoRepository(configuracaoAmbiente.urlAPI));
    it.registerLazySingleton(
        () => UsuarioRepository(configuracaoAmbiente.urlAPI));
    it.registerLazySingleton(
        () => AutenticadoLocalRepository(FlutterSecureStorage()));
    it.registerLazySingleton(
        () => ListagemOfertaCubit(ofertaRepository: it.get()));

    final usuario = await it.get<AutenticadoLocalRepository>().buscarUsuario();
    final token = await it.get<AutenticadoLocalRepository>().buscarToken();

    it.registerLazySingleton(
      () => AutenticacaoCubit(
        estadoInicial: usuario != null && token != null
            ? UsuarioLogadoState(usuario, token)
            : UsuarioNaoLogadoState(),
        alertasAppCubit: it.get(),
        autenticacaoRepository: it.get(),
        localAutenticadoRepository: it.get(),
      ),
    );
    it.registerLazySingleton(() => SubmissaoOfertaCubit(
          alertasAppCubit: it.get(),
          ofertaRepository: it.get(),
          listagemOfertaCubit: it.get(),
          autenticacaoCubit: it.get(),
        ));

    it.registerLazySingleton(() => OfertaRepository(
          configuracaoAmbiente.urlAPI,
          autenticacaoCubit: it.get(),
          autenticadoLocalRepository: it.get(),
        ));

    it.registerLazySingleton(() => UsuarioLogadoRepository(
          configuracaoAmbiente.urlAPI,
          autenticacaoCubit: it.get(),
          autenticadoLocalRepository: it.get(),
        ));
    it.registerLazySingleton(() => SubmissaoUsuarioCubit(
          alertasAppCubit: it.get(),
          usuarioRepository: it.get(),
          usuarioLogadoRepository: it.get(),
        ));
  }
}
