import 'package:json_annotation/json_annotation.dart';

import 'package:easylanche/core/enums.dart';

part 'oferta.g.dart';

@JsonSerializable()
class Oferta {
  final int? id;
  final String telefone;
  final String descricao;
  final TipoOferta tipo;
  @JsonKey(name: 'status')
  final bool isAtivo;
  final double valor;

  const Oferta({
    this.id,
    required this.telefone,
    required this.descricao,
    required this.tipo,
    required this.isAtivo,
    required this.valor,
  });

  Map<String, dynamic> toJson() => _$OfertaToJson(this);

  static String fromTipoJson(Map json) => json['descricao'];
}
