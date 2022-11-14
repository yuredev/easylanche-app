import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/constants/mapeamentos.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/presentation/widgets/shared/barra_cinza_widget.dart';
import 'package:easylanche/presentation/widgets/shared/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CardOfertaPerfilWidget extends StatelessWidget {
  final String? titulo;
  final double? valor;
  final TipoOferta? tipoOferta;
  final bool isCarregando;
  final void Function()? aoPressionar;

  const CardOfertaPerfilWidget({
    required this.titulo,
    required this.valor,
    this.aoPressionar,
    this.tipoOferta,
    this.isCarregando = false,
  });

  @override
  Widget build(BuildContext context) {
    final conteudo = Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: aoPressionar,
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
                height: 75,
                width: 75,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FittedBox(
                    child: ![TipoOferta.salgado, TipoOferta.doce]
                            .contains(tipoOferta)
                        ? Icon(Icons.fastfood, color: Colors.grey)
                        : CircleAvatar(
                            backgroundImage: AssetImage(
                              Mapeamentos.imagensTipoOfeta[tipoOferta]!,
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
                                  titulo!,
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
                              margin: EdgeInsets.only(top: 10),
                              child: BarraCinzaWidget(altura: 16, largura: 60),
                            )
                          : Text(
                              "R\$ ${valor.toString()}0",
                              style: TextStyle(
                                height: 2,
                                fontSize: 15,
                                color: Cores.laranjaPrincipal,
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
