import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

class BotaoDropdownWidget<T> extends StatelessWidget {
  final T? valor;
  final void Function(T?) aoAlterar;
  final Map<T, String> mapeamento;
  final String? dica;
  final double? altura;
  final double largura;
  final double? raioBorda;
  final bool possuiErro;

  const BotaoDropdownWidget({
    required this.valor,
    required this.aoAlterar,
    required this.mapeamento,
    this.raioBorda,
    this.possuiErro = false,
    this.altura,
    this.dica,
    this.largura = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: largura,
      padding: const EdgeInsets.only(left: 18, right: 5),
      decoration: BoxDecoration(
        color: Cores.textFieldBackground,
        border: Border.all(
          width: 1,
          color: possuiErro ? Cores.vermelhoErro : Cores.cinzaBordaInput,
        ),
        borderRadius:
            raioBorda != null ? BorderRadius.circular(raioBorda!) : null,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          style: TextStyle(color: Cores.textField),
          value: valor,
          onChanged: aoAlterar,
          hint: dica != null
              ? Text(
                  dica!,
                  style: TextStyle(
                    color: Cores.cinzaPlaceholder,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                )
              : null,
          items: mapeamento.keys.map((v) {
            return DropdownMenuItem<T>(
              value: v,
              child: Text(mapeamento[v]!),
            );
          }).toList(),
        ),
      ),
    );
  }
}
