// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario extends Equatable {
  final int? id;
  final String nome;
  final String telefone;
  @JsonKey(name: 'username')
  final String nomeUsuario;
  // TODO: substituir por enum
  final String papel;

  const Usuario({
    this.id,
    required this.nome,
    required this.telefone,
    required this.nomeUsuario,
    required this.papel,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);

  static Usuario fromStorage(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        telefone: json['telefone'],
        papel: json['papel'],
        nome: json['nome'],
        nomeUsuario: json['nomeUsuario'],
      );

  Map<String, dynamic> toStorage(Usuario usuario) => {
        'telefone': usuario.telefone,
        'nome': usuario.nome,
        'papel': usuario.papel,
        'nomeUsuario': usuario.nomeUsuario,
        'id': usuario.id,
      };

  @override
  List<Object?> get props => [
        telefone,
        nome,
        nomeUsuario,
        papel,
        id,
      ];

  Usuario copy({
    String? nome,
    String? telefone,
    String? nomeUsuario,
    String? papel,
    int? id,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      nomeUsuario: nomeUsuario ?? this.nomeUsuario,
      papel: papel ?? this.papel,
      id: id ?? this.id,
    );
  }
}
