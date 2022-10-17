import 'package:easylanche/core/ambiente.dart';
import 'package:easylanche/data/repositories/autenticacao/remote/remote_autenticacao_repository.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class Instancias {
  static GetIt get it => GetIt.I;

  static void inicializar(ConfiguracaoAmbiente configiguracaoAmbiente) {
    it.registerLazySingleton(() => AlertasAppCubit());
    it.registerLazySingleton(() => RemoteAutenticacaoRepository());
    it.registerLazySingleton(
        () => AutenticadoLocalRepository(FlutterSecureStorage()));
    it.registerLazySingleton(
        () => OfertaRepository(configiguracaoAmbiente.urlAPI));
    it.registerLazySingleton(() => SubmissaoOfertaCubit(
          alertasAppCubit: it.get(),
          ofertaRepository: it.get(),
          listagemOfertaCubit: it.get(),
        ));
    it.registerLazySingleton(
        () => ListagemOfertaCubit(ofertaRepository: it.get()));
    it.registerLazySingleton(() => AutenticacaoCubit(
          alertasAppCubit: it.get(),
          autenticacaoRepository: it.get(),
          localAutenticadoRepository: it.get(),
        ));
  }
}
