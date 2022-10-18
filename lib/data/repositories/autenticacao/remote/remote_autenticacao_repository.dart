import 'package:dio/dio.dart';
import 'package:easylanche/core/dio_config.dart';
import 'package:easylanche/data/models/autenticacao/autenticacao.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_autenticacao_repository.g.dart';

@RestApi()
abstract class RemoteAutenticacaoRepository {
  factory RemoteAutenticacaoRepository(String urlAPI) =>
      RemoteAutenticacaoRepository.retrofit(
        dioConfig,
        baseUrl: urlAPI,
      );

  factory RemoteAutenticacaoRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _RemoteAutenticacaoRepository;

  @POST('/auth/login')
  Future<RespostaAuthDTO> autenticar(@Body() RequisicaoAuthDTO authDTO);
}
