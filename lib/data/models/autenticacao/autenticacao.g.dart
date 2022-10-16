// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequisicaoAuthDTO _$RequisicaoAuthDTOFromJson(Map<String, dynamic> json) =>
    RequisicaoAuthDTO(
      json['login'] as String,
      json['senha'] as String,
    );

Map<String, dynamic> _$RequisicaoAuthDTOToJson(RequisicaoAuthDTO instance) =>
    <String, dynamic>{
      'login': instance.login,
      'senha': instance.senha,
    };

RespostaAuthDTO _$RespostaAuthDTOFromJson(Map<String, dynamic> json) =>
    RespostaAuthDTO(
      json['token'] as String,
      Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RespostaAuthDTOToJson(RespostaAuthDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
      'usuario': instance.usuario,
    };
