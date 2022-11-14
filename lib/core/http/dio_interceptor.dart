import 'package:dio/dio.dart';
import 'package:easylanche/data/repositories/autenticado_local/autenticado_local_repository.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';


class AutenticadoInterceptors extends Interceptor {
  final AutenticacaoCubit _autenticacaoCubit;
  final AutenticadoLocalRepository _localAutenticadoRepository;

  AutenticadoInterceptors(this._autenticacaoCubit, this._localAutenticadoRepository);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _autenticacaoCubit.sair(exibirMensagem: false);
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var token = await _localAutenticadoRepository.buscarToken();
    if (token != null && token != '') {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}

