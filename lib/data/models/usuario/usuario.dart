import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario extends Equatable {
  final String nome;
  final String telefone;
  final String biografia;

  const Usuario({
    required this.nome,
    required this.telefone,
    required this.biografia,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);

  static Usuario fromStorage(Map<String, dynamic> json) => Usuario(
        telefone: json['telefone'],
        biografia: json['biografia'],
        nome: json['nome'],
      );

  Map<String, dynamic> toStorage(Usuario usuario) => {
        'telefone': usuario.telefone,
        'nome': usuario.nome,
        'biografia': usuario.biografia,
      };

  @override
  List<Object?> get props => [
        telefone,
        nome,
      ];
}
