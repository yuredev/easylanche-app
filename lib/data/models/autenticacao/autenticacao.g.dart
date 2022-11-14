// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequisicaoAuthDTO _$RequisicaoAuthDTOFromJson(Map<String, dynamic> json) =>
    RequisicaoAuthDTO(
      json['username'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RequisicaoAuthDTOToJson(RequisicaoAuthDTO instance) =>
    <String, dynamic>{
      'username': instance.login,
      'password': instance.senha,
    };

RespostaAuthDTO _$RespostaAuthDTOFromJson(Map<String, dynamic> json) =>
    RespostaAuthDTO(
      Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
      json['token'] as String,
    );

Map<String, dynamic> _$RespostaAuthDTOToJson(RespostaAuthDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
      'usuario': instance.usuario,
    };
