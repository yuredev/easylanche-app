
import 'package:json_annotation/json_annotation.dart';

enum TipoOferta {
  @JsonValue('salgado')
  salgado,
  @JsonValue('salgado')
  doce,
  @JsonValue('bebida')
  bebida,
  @JsonValue('outro')
  outro, 
}