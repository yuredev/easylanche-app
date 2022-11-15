import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/constants/mapeamentos.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/presentation/widgets/shared/barra_cinza_widget.dart';
import 'package:easylanche/presentation/widgets/shared/shimmer_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/rotas.dart';

class CardOfertaWidget extends StatelessWidget {
  final Oferta? oferta;
  final bool isCarregando;
  final void Function()? aoPressionar;

  const CardOfertaWidget({
    this.aoPressionar,
    this.isCarregando = false,
    this.oferta,
  });

  @override
  Widget build(BuildContext context) {
    final conteudo = Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.pushNamed(
          context,
          Rotas.infoOferta,
          arguments: {
            'oferta': oferta,
          },
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                width: 100,
                child: isCarregando
                    ? Icon(Icons.fastfood, color: Colors.grey, size: 70)
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FittedBox(
                          child: ![TipoOferta.salgado, TipoOferta.doce]
                                  .contains(oferta!.tipo)
                              ? Icon(Icons.fastfood, color: Colors.grey)
                              : CircleAvatar(
                                  backgroundImage: AssetImage(
                                    Mapeamentos.imagensTipoOfeta[oferta!.tipo]!,
                                  ),
                                ),
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isCarregando
                              ? BarraCinzaWidget(altura: 18, largura: 80)
                              : Text(
                                  oferta!.titulo,
                                  style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ],
                      ),
                      isCarregando
                          ? Container(
                              margin: EdgeInsets.only(top: 2),
                              child: const BarraCinzaWidget(
                                altura: 14,
                                largura: 140,
                              ),
                            )
                          : Text(
                              oferta!.descricao,
                              style: TextStyle(
                                color: Cores.laranjaPrincipal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      isCarregando
                          ? Container(
                              margin: EdgeInsets.only(top: 10),
                              child: BarraCinzaWidget(altura: 16, largura: 60),
                            )
                          : Text(
                              "R\$ ${oferta!.valor.toString()}0",
                              style: TextStyle(
                                height: 2,
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isCarregando ? ShimmerWidget(child: conteudo) : conteudo,
    );
  }
}
