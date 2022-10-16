import 'package:easylanche/core/enums.dart';

abstract class Mapeamentos {
  static const labelsDropdown = {
    TipoOferta.salgado: 'Salgado',
    TipoOferta.bebida: 'Bebida',
    TipoOferta.doce: 'Doce',
    TipoOferta.outro: 'Outro',
  };
  static const imagensTipoOfeta = {
    TipoOferta.salgado: 'assets/images/salgado.jpg',
    TipoOferta.doce: 'assets/images/doce.png',
  };
}
