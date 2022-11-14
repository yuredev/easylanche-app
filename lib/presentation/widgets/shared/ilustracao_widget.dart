import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IlustracaoWidget extends StatelessWidget {
  final String nomeIlustracao;
  final String titulo;
  final String? subtitulo;
  final bool isTituloTopo;
  final double? larguraImagem;
  final double? alturaImagem;
  final bool isCentralizado;
  final TextAlign? alinhamentoTitulo;
  final TextAlign? alinhamentoSubtitulo;
  final bool isAnimacao;
  final double distanciaTextoImagem;
  final double tamanhoFonte;
  final bool isTituloNegrito;
  final Color? corTitulo;

  const IlustracaoWidget({
    Key? key,
    required this.nomeIlustracao,
    required this.titulo,
    this.isCentralizado = true,
    this.tamanhoFonte = 15,
    this.isTituloTopo = false,
    this.distanciaTextoImagem = 16,
    this.isAnimacao = false,
    this.corTitulo,
    this.isTituloNegrito = false,
    this.subtitulo,
    this.larguraImagem,
    this.alturaImagem,
    this.alinhamentoTitulo,
    this.alinhamentoSubtitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conteudo = [
      isAnimacao
          ? Lottie.asset(
              'assets/animations/$nomeIlustracao',
              width: larguraImagem,
              height: alturaImagem,
            )
          : Image.asset(
              'assets/images/$nomeIlustracao',
              width: larguraImagem,
              height: alturaImagem,
            ),
      SizedBox(height: distanciaTextoImagem),
      SizedBox(
        width: 250,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Text(
                titulo,
                textAlign: alinhamentoTitulo,
                style: TextStyle(
                  color: corTitulo,
                  fontSize: tamanhoFonte,
                  fontWeight: isTituloNegrito ? FontWeight.bold : null,
                ),
              ),
            ),
            if (subtitulo != null)
              Text(
                subtitulo!,
                textAlign: alinhamentoSubtitulo,
                style: TextStyle(
                  fontSize: tamanhoFonte - 3.8,
                  color: Cores.cinzaSubtitulo,
                ),
              ),
          ],
        ),
      ),
    ];

    return Align(
      alignment: isCentralizado ? Alignment.center : Alignment.topLeft,
      child: Column(
        children: isTituloTopo ? conteudo.reversed.toList() : conteudo,
      ),
    );
  }
}
