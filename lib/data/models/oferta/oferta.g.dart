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
      tipo: $enumDecodeNullable(_$TipoOfertaEnumMap, json['tipo']) ??
          TipoOferta.outro,
      isAtivo: json['status'] as bool,
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$OfertaToJson(Oferta instance) => <String, dynamic>{
      'id': instance.id,
      'telefone': instance.telefone,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tipo': _$TipoOfertaEnumMap[instance.tipo]!,
      'status': instance.isAtivo,
      'valor': instance.valor,
    };

const _$TipoOfertaEnumMap = {
  TipoOferta.salgado: 'salgado',
  TipoOferta.doce: 'doce',
  TipoOferta.bebida: 'bebida',
  TipoOferta.outro: 'outro',
};
