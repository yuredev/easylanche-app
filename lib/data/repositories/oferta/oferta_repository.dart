import 'package:dio/dio.dart';
import 'package:easylanche/core/dio_config.dart';
import 'package:easylanche/core/http/dio_interceptor.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:retrofit/retrofit.dart';

part 'oferta_repository.g.dart';

@RestApi()
abstract class OfertaRepository {
  factory OfertaRepository(
    String urlAPI, {
    required AutenticacaoCubit autenticacaoCubit,
    required AutenticadoLocalRepository autenticadoLocalRepository,
  }) =>
      OfertaRepository.retrofit(
        dioConfig
          ..interceptors.add(AutenticadoInterceptors(
            autenticacaoCubit,
            autenticadoLocalRepository,
          )),
        baseUrl: urlAPI,
      );

  factory OfertaRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _OfertaRepository;

  @GET('/comida')
  Future<List<Oferta>> listar();

  @POST('/usuario/{id}/comida')
  Future<Oferta> cadastrar(@Path() int id, @Body() Oferta oferta);

  @PUT('/comida/{id}')
  Future<Oferta> atualizar(@Path() int id, @Body() Oferta oferta);

  @DELETE('/comida/{id}')
  Future<void> remover(@Path() int id);
}
