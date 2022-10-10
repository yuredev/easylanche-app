import 'package:easylanche/presentation/widgets/shared/barra_cinza_widget.dart';
import 'package:easylanche/presentation/widgets/shared/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CardOfertaWidget extends StatelessWidget {
  final String? titulo;
  final String? descricao;
  final double? valor;
  final bool isCarregando;

  const CardOfertaWidget({
    required this.titulo,
    required this.descricao,
    required this.valor,
    this.isCarregando = false,
  });

  @override
  Widget build(BuildContext context) {
    final conteudo = Container(
      margin: EdgeInsets.all(14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/salgado.jpg',
              width: 100,
              height: 100,
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
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  isCarregando
                      ? BarraCinzaWidget(altura: 14, largura: 140)
                      : Text(
                          descricao!,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          ),
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
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
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
