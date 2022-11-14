// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'] as int?,
      nome: json['nome'] as String,
      telefone: json['telefone'] as String,
      nomeUsuario: json['username'] as String,
      papel: json['papel'] as String,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'telefone': instance.telefone,
      'username': instance.nomeUsuario,
      'papel': instance.papel,
    };
