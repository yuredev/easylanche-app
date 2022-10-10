import 'package:easylanche/core/ambiente.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:get_it/get_it.dart';

abstract class Instancias {
  static GetIt get it => GetIt.I;

  static void inicializar(ConfiguracaoAmbiente configiguracaoAmbiente) {
    it.registerLazySingleton(() => AlertasAppCubit());
    it.registerLazySingleton(
        () => OfertaRepository(configiguracaoAmbiente.urlAPI));
    it.registerLazySingleton(() => SubmissaoOfertaCubit(
          alertasAppCubit: it.get(),
          ofertaRepository: it.get(),
          listagemOfertaCubit: it.get(),
        ));
    it.registerLazySingleton(
        () => ListagemOfertaCubit(ofertaRepository: it.get()));
  }
}
