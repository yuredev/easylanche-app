import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class CampoTextoWidget extends StatelessWidget {
  final String? textoLabel;
  final String? text;
  final Function? aoAlterar;
  final Function()? onTap;
  final bool esconderTexto;
  final TextEditingController? controlador;
  final TextInputFormatter? mascara;
  final TextInputType? tipo;
  final TextInputAction? acaoTeclado;
  final Icon? icone;
  final IconButton? iconeBotao;
  final double raioBorda;
  final String? Function(String?)? validador;
  final bool apenasLeitura;
  final int? tamanhoMax;
  final int? maximoLinhas;
  final bool mostrarContador;
  final int contador;

  const CampoTextoWidget({
    Key? key,
    this.aoAlterar,
    this.onTap,
    this.textoLabel,
    this.text,
    this.controlador,
    this.mascara,
    this.tipo = TextInputType.text,
    this.esconderTexto = false,
    this.apenasLeitura = false,
    this.acaoTeclado,
    this.icone,
    this.iconeBotao,
    this.raioBorda = 12,
    this.validador,
    this.tamanhoMax,
    this.maximoLinhas,
    this.mostrarContador = false,
    this.contador = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: text,
      onTap: onTap,
      maxLength: tamanhoMax,
      keyboardType: tipo,
      obscureText: esconderTexto,
      controller: controlador,
      readOnly: apenasLeitura,
      maxLines: maximoLinhas,
      onChanged: (String v) => aoAlterar != null ? aoAlterar!(v) : null,
      inputFormatters: mascara != null ? [mascara!] : [],
      validator: (String? v) {
        if (validador != null) {
          return validador!(v);
        }
        return null;
      },
      autocorrect: false,
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      textInputAction: acaoTeclado,
      style: const TextStyle(color: Cores.textField),
      enableSuggestions: false,
      decoration: InputDecoration(
        counterText: mostrarContador ? '$contador/$tamanhoMax' : '',
        counterStyle: GoogleFonts.roboto(fontSize: 12),
        errorMaxLines: 3,
        labelText: textoLabel,
        suffixIcon: iconeBotao ?? icone,
        contentPadding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 16,
          bottom: 16,
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(raioBorda),
        ),
        fillColor: Cores.textFieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raioBorda),
        ),
        labelStyle: TextStyle(color: Cores.cinzaPlaceholder),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cores.cinzaBordaInput,
          ),
          borderRadius: BorderRadius.circular(raioBorda),
        ),
      ),
    );
  }
}
