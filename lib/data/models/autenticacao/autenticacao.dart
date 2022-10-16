import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'autenticacao.g.dart';

@JsonSerializable()
class RequisicaoAuthDTO {
  final String login;
  final String senha;

  RequisicaoAuthDTO(this.login, this.senha);

  factory RequisicaoAuthDTO.fromJson(Map<String, dynamic> json) =>
      _$RequisicaoAuthDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RequisicaoAuthDTOToJson(this);
}

@JsonSerializable()
class RespostaAuthDTO {
  final String token;
  final Usuario usuario;

  RespostaAuthDTO(this.token, this.usuario);

  factory RespostaAuthDTO.fromJson(Map<String, dynamic> json) =>
      _$RespostaAuthDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RespostaAuthDTOToJson(this);
}
