// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_usuario_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroUsuarioDTOEnvio _$CadastroUsuarioDTOEnvioFromJson(
        Map<String, dynamic> json) =>
    CadastroUsuarioDTOEnvio(
      nome: json['nome'] as String,
      telefone: json['telefone'] as String,
      nomeUsuario: json['username'] as String,
      papel: json['papel'] as String,
      id: json['id'] as int?,
      senha: json['password'] as String,
    );

Map<String, dynamic> _$CadastroUsuarioDTOEnvioToJson(
        CadastroUsuarioDTOEnvio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'telefone': instance.telefone,
      'username': instance.nomeUsuario,
      'papel': instance.papel,
      'password': instance.senha,
    };
