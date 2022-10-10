// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oferta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oferta _$OfertaFromJson(Map<String, dynamic> json) => Oferta(
      id: json['id'] as int?,
      telefone: json['telefone'] as String,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      isAtivo: json['status'] as bool,
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$OfertaToJson(Oferta instance) => <String, dynamic>{
      'id': instance.id,
      'telefone': instance.telefone,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'status': instance.isAtivo,
      'valor': instance.valor,
    };
