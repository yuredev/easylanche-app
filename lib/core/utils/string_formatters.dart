abstract class StringFormatters {
  static String toCNPJ(String valor) {
    valor = valor.trim();
    if (valor.length > 14) {
      valor = valor.substring(0, 14);
    } else if (valor.length < 14) {
      valor = valor.padLeft(14, '0');
    }
    return '${valor.substring(0, 2)}.${valor.substring(2, 5)}.${valor.substring(5, 8)}/${valor.substring(8, 12)}-${valor.substring(12, 14)}';
  }
}
