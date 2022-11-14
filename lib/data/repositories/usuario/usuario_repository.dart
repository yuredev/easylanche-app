import 'package:dio/dio.dart';
import 'package:easylanche/data/models/dtos/cadastro_usuario_dto.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:retrofit/http.dart';

import 'package:easylanche/core/dio_config.dart';

part 'usuario_repository.g.dart';

@RestApi()
abstract class UsuarioRepository {
  factory UsuarioRepository(String urlAPI) => UsuarioRepository.retrofit(
        dioConfig,
        baseUrl: urlAPI + '/usuario',
      );

  factory UsuarioRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _UsuarioRepository;

  @POST('')
  Future<Usuario> cadastrar(@Body() CadastroUsuarioDTOEnvio cadastroUsuarioDTO);
}
