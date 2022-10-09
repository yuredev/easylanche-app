import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoElevadoWidget extends StatelessWidget {
  final String nome;
  final VoidCallback? aoPressionar;
  final Widget? iconeEsquerda;
  final Widget? iconeDireita;
  final double raioBorda;
  final Color cor;
  final Color corTexto;
  final double? tamanhoFonte;
  final FontWeight? pesoFonte;
  final EdgeInsetsGeometry? padding;
  final double? largura;
  final double? altura;
  final double? distanciaIconeTitulo;
  final double? elevacao;
  final String? textoCarregamento;
  final bool isCarregando;
  final EdgeInsets? margemTitulo;

  const BotaoElevadoWidget({
    Key? key,
    this.aoPressionar,
    required this.nome,
    required this.cor,
    required this.corTexto,
    this.margemTitulo,
    this.tamanhoFonte,
    this.iconeEsquerda,
    this.iconeDireita,
    this.pesoFonte,
    this.padding,
    this.largura,
    this.distanciaIconeTitulo,
    this.elevacao,
    this.altura,
    this.textoCarregamento,
    this.isCarregando = false,
    this.raioBorda = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estiloFonte = GoogleFonts.roboto(
      fontSize: tamanhoFonte ?? 20,
      fontWeight: pesoFonte ?? FontWeight.w700,
      color: aoPressionar == null ? Colors.white : corTexto,
    );
    Widget child;
    if (isCarregando) {
      child = textoCarregamento != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(child: CircularProgressIndicator(color: corTexto)),
                const SizedBox(width: 8),
                Container(
                  margin: margemTitulo,
                  child: Text(
                    textoCarregamento!,
                    style: TextStyle(
                      fontSize: tamanhoFonte ?? 20,
                      color: aoPressionar == null ? Colors.white : corTexto,
                    ),
                  ),
                ),
              ],
            )
          : FittedBox(child: CircularProgressIndicator(color: corTexto));
    } else if (iconeEsquerda == null) {
      child = Text(nome, style: estiloFonte);
    } else {
      child = FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconeEsquerda != null) iconeEsquerda!,
            if (iconeEsquerda != null)
              SizedBox(width: distanciaIconeTitulo ?? 6),
            Container(
              margin: margemTitulo,
              child: Text(
                nome,
                style: estiloFonte,
              ),
            ),
            if (iconeDireita != null)
              SizedBox(width: distanciaIconeTitulo ?? 6),
            if (iconeDireita != null) iconeDireita!,
          ],
        ),
      );
    }
    return SizedBox(
      height: altura,
      width: largura,
      child: ElevatedButton(
        onPressed: () {
          if (isCarregando || aoPressionar == null) return;
          aoPressionar!();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 0),
          elevation: elevacao,
          padding: padding,
          primary: cor,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raioBorda),
          ),
        ),
        child: child,
      ),
    );
  }
}
