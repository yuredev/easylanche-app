import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

enum TipoIndicadorEtapaWidget {
  duasEtapas,
  tresEtapas,
}

class IndicadorEtapaWidget extends StatelessWidget {
  final int etapa;
  final double largura;
  final TipoIndicadorEtapaWidget tipoIndicadorEtapaWidget;

  const IndicadorEtapaWidget({
    Key? key,
    required this.etapa,
    this.tipoIndicadorEtapaWidget = TipoIndicadorEtapaWidget.tresEtapas,
    required this.largura,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tamanhoIcone = 13.0;
    const iconeBola = SizedBox(
      height: tamanhoIcone,
      width: tamanhoIcone,
      child: FittedBox(
        child: Icon(Icons.circle, color: Colors.white),
      ),
    );
    final alinhamento = tipoIndicadorEtapaWidget == TipoIndicadorEtapaWidget.tresEtapas
        ? [
            MainAxisAlignment.start,
            MainAxisAlignment.center,
            MainAxisAlignment.end,
          ]
        : [
            MainAxisAlignment.start,
            MainAxisAlignment.end,
          ];
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: SizedBox(
            width: largura,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                  height: 4,
                  margin: EdgeInsets.symmetric(horizontal: tamanhoIcone * 0.9),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconeBola,
                    iconeBola,
                    if (tipoIndicadorEtapaWidget == TipoIndicadorEtapaWidget.tresEtapas)
                      iconeBola,
                  ],
                ),
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: largura,
            child: Row(
              mainAxisAlignment: alinhamento[etapa - 1],
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Cores.laranjaPrincipal,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  width: 27,
                  height: 27,
                  child: Text(
                    etapa.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
