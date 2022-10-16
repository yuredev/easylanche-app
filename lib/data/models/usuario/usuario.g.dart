// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      nome: json['nome'] as String,
      telefone: json['telefone'] as String,
      biografia: json['biografia'] as String,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'nome': instance.nome,
      'telefone': instance.telefone,
      'biografia': instance.biografia,
    };
