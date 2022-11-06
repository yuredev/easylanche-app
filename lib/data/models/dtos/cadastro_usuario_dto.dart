// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:easylanche/data/models/usuario/usuario.dart';

part 'cadastro_usuario_dto.g.dart';

@JsonSerializable()
class CadastroUsuarioDTOEnvio extends Usuario {
  @JsonKey(name: 'password')
  final String senha;

  const CadastroUsuarioDTOEnvio({
    required String nome,
    required String telefone,
    required String nomeUsuario,
    required String papel,
    int? id,
    required this.senha,
  }) : super(
          nome: nome,
          telefone: telefone,
          nomeUsuario: nomeUsuario,
          papel: papel,
          id: id,
        );

  @override
  List<Object?> get props => [
        ...super.props,
        senha,
      ];

  @override
  CadastroUsuarioDTOEnvio copy({
    String? nome,
    String? telefone,
    String? nomeUsuario,
    String? papel,
    String? senha,
    int? id,
  }) {
    return CadastroUsuarioDTOEnvio(
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      nomeUsuario: nomeUsuario ?? this.nomeUsuario,
      papel: papel ?? this.papel,
      senha: senha ?? this.senha,
      id: id ?? this.id,
    );
  }

  factory CadastroUsuarioDTOEnvio.fromJson(Map<String, dynamic> json) =>
      _$CadastroUsuarioDTOEnvioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CadastroUsuarioDTOEnvioToJson(this);
}
