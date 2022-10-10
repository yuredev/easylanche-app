import 'package:json_annotation/json_annotation.dart';

import 'package:easylanche/core/enums.dart';

part 'oferta.g.dart';

@JsonSerializable()
class Oferta {
  final int? id;
  final String telefone;
  final String nome;
  final String descricao;
  @JsonKey(ignore: true)
  final TipoOferta tipo;
  @JsonKey(name: 'status')
  final bool isAtivo;
  final double valor;

  const Oferta({
    this.id,
    required this.telefone,
    required this.nome, 
    required this.descricao,
    this.tipo = TipoOferta.outro,
    required this.isAtivo,
    required this.valor,
  });

  factory Oferta.fromJson(Map<String, dynamic> json) => _$OfertaFromJson(json);

  Map<String, dynamic> toJson() => _$OfertaToJson(this);
}
