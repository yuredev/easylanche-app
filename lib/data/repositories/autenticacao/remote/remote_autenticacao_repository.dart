import 'package:dio/dio.dart';
import 'package:easylanche/data/models/autenticacao/autenticacao.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';

class RemoteAutenticacaoRepository {
  Future<RespostaAuthDTO> autenticar(RequisicaoAuthDTO authDTO) {
    if (authDTO.login == 'yure' && authDTO.senha == '') {
      return Future.delayed(
        Duration(seconds: 5),
        () => RespostaAuthDTO(
          '8df739g45354jsdfjbsjisjndns33030222jkjfs-305jvfsiwaa212f9',
          Usuario(
            nome: 'yure',
            telefone: '40028922',
            biografia: 'eu sou eu',
          ),
        ),
      );
    }
    final e = DioError(
      requestOptions: RequestOptions(path: ''),
      type: DioErrorType.response,
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 403
      ),
    );
    throw e;
  }
}
