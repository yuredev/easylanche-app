// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oferta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oferta _$OfertaFromJson(Map<String, dynamic> json) => Oferta(
      id: json['id'] as int?,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      tipo: $enumDecodeNullable(_$TipoOfertaEnumMap, json['tipo']) ??
          TipoOferta.outro,
      isAtivo: json['status'] as bool,
      usuario: json['usuario'] == null
          ? null
          : Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$OfertaToJson(Oferta instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'tipo': _$TipoOfertaEnumMap[instance.tipo]!,
      'status': instance.isAtivo,
      'valor': instance.valor,
      'usuario': instance.usuario,
    };

const _$TipoOfertaEnumMap = {
  TipoOferta.salgado: 'salgado',
  TipoOferta.doce: 'doce',
  TipoOferta.bebida: 'bebida',
  TipoOferta.outro: 'outro',
};
