import 'package:dio/dio.dart';
import 'package:easylanche/core/dio_config.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:retrofit/retrofit.dart';

part 'oferta_repository.g.dart';

@RestApi()
abstract class OfertaRepository {
  factory OfertaRepository(String urlAPI) => OfertaRepository.retrofit(
        dioConfig,
        baseUrl: urlAPI + '/ofertas',
      );

  factory OfertaRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _OfertaRepository;

  @GET('')
  Future<List<Oferta>> listar();

  @POST('')
  Future<Oferta> cadastrar(@Body() Oferta oferta);
}
