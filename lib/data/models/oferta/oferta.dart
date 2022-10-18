import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:easylanche/core/enums.dart';

part 'oferta.g.dart';

@JsonSerializable()
class Oferta {
  final int? id;
  final String titulo;
  final String descricao;
  @JsonKey(defaultValue: TipoOferta.outro)
  final TipoOferta tipo;
  @JsonKey(name: 'status')
  final bool isAtivo;
  final double valor;
  final Usuario? usuario;

  const Oferta({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.tipo,
    required this.isAtivo,
    this.usuario,
    required this.valor,
  });

  factory Oferta.fromJson(Map<String, dynamic> json) => _$OfertaFromJson(json);

  Map<String, dynamic> toJson() => _$OfertaToJson(this);
}
