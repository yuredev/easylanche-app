import 'package:dio/dio.dart';
import 'package:easylanche/core/http/dio_interceptor.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:retrofit/http.dart';

import 'package:easylanche/core/dio_config.dart';

part 'usuario_logado_repository.g.dart';

@RestApi()
abstract class UsuarioLogadoRepository {
  factory UsuarioLogadoRepository(
    String urlAPI, {
    required AutenticacaoCubit autenticacaoCubit,
    required AutenticadoLocalRepository autenticadoLocalRepository,
  }) =>
      UsuarioLogadoRepository.retrofit(
        dioConfig
          ..interceptors.add(
            AutenticadoInterceptors(
              autenticacaoCubit,
              autenticadoLocalRepository,
            ),
          ),
        baseUrl: urlAPI + '/usuario',
      );

  factory UsuarioLogadoRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _UsuarioLogadoRepository;

  @DELETE('/{id}')
  Future<void> remover(@Path() int id);
}
