import 'package:easylanche/data/repositories/formulario_obra_repository.dart';
import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:get_it/get_it.dart';

abstract class Instancias {
  static GetIt get it => GetIt.I;

  static void inicializar() {
    it.registerLazySingleton(() => FormularioObraRepository());
    it.registerLazySingleton(() => AlertasAppCubit());
    it.registerLazySingleton(
        () => SubmissaoOfertaCubit(alertasAppCubit: it.get()));
  }
}
