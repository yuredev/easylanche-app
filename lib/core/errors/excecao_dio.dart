import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;

class ExcecaoDio implements Exception {
  int? status;
  String mensagem = '';

  ExcecaoDio.withError(DioError error) {
    _handleError(error);
  }

  int? getStatusCode() {
    return status;
  }

  String getMensagem() {
    return mensagem;
  }

  _getMensagemErroApi(DioError error) {
    try {
      var mensagem = 'Resposta inválida do servidor';
      var data = error.response?.data;
      if (data != null && data.toString().isNotEmpty) {
        mensagem = _isjsonResponse(data) ? jsonDecode(data)['detail'] : data;
      }
      return mensagem;
    } catch (e) {
      return 'Resposta inválida do servidor';
    }
  }

  _isjsonResponse(dynamic data) {
    try {
      json.decode(data) as Map<String, dynamic>;
      return true;
    } catch (e) {
      return false;
    }
  }

  _handleError(DioError error) {
    status = error.response != null ? error.response!.statusCode : 500;
    switch (error.type) {
      case DioErrorType.cancel:
        mensagem = 'A requisição foi cancelada';
        break;
      case DioErrorType.connectTimeout:
        mensagem = 'Tempo de conexão expirado';
        break;
      case DioErrorType.receiveTimeout:
        mensagem = 'Tempo de conexão expirado';
        break;
      case DioErrorType.sendTimeout:
        mensagem = 'Tempo de conexão expirado';
        break;
      case DioErrorType.response:
        mensagem = _getMensagemErroApi(error);
        break;
      case DioErrorType.other:
        mensagem = 'Erro inesperado de conexão';
        break;
    }
    if (status == 401) {
      mensagem = 'Token de acesso expirado, realize o login novamente';
    }
    return mensagem;
  }
}
