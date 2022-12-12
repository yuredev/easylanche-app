import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BotaoAtivoWidget extends StatelessWidget {
  final Function() aoPressionar;
  final String titulo;
  final String caminhoImagem;
  final bool isAtivo;

  const BotaoAtivoWidget({
    Key? key,
    required this.aoPressionar,
    required this.caminhoImagem,
    required this.titulo,
    required this.isAtivo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isAtivo ? Cores.laranjaPrincipal : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(14),
            color: Colors.transparent,
            child: InkWell(
              onTap: aoPressionar,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    caminhoImagem,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Text(titulo),
        ),
      ],
    );
  }
}
