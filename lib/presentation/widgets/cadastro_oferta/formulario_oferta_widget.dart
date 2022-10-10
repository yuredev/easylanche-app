import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/constants/mapeamentos.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/presentation/widgets/shared/botao_dropdown_widget.dart';
import 'package:easylanche/presentation/widgets/shared/campo_texto_widget.dart';
import 'package:flutter/material.dart';

class FormularioOfertaWidget extends StatefulWidget {
  final TextEditingController descricaoCtrl;
  final TextEditingController valorCtrl;
  final TipoOferta? tipoOferta;
  final void Function(TipoOferta? tipo) aoAlterarTipoOferta;
  final GlobalKey<FormState> chaveFormulario;
  final String? msgErroTipoOferta;

  const FormularioOfertaWidget({
    Key? key,
    required this.chaveFormulario,
    required this.descricaoCtrl,
    required this.tipoOferta,
    required this.valorCtrl,
    required this.aoAlterarTipoOferta,
    required this.msgErroTipoOferta,
  }) : super(key: key);

  @override
  State<FormularioOfertaWidget> createState() => _FormularioOfertaWidgetState();
}

class _FormularioOfertaWidgetState extends State<FormularioOfertaWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.chaveFormulario,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              'Dados da oferta',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: CampoTextoWidget(
              textoLabel: "Descrição",
              aoAlterar: (String? v) {},
              controlador: widget.descricaoCtrl,
              maximoLinhas: 3,
              tipo: TextInputType.text,
              acaoTeclado: TextInputAction.next,
              raioBorda: 8,
              validador: (descricao) {
                if (descricao == null || descricao.isEmpty) {
                  return 'Informe uma descrição para sua oferta';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: CampoTextoWidget(
              textoLabel: "Valor",
              aoAlterar: (String? v) {},
              controlador: widget.valorCtrl,
              raioBorda: 8,
              validador: (preco) {
                if (preco == null || preco.isEmpty) {
                  return 'Informe o preço de sua oferta';
                }
                return null;
              },
              tipo: TextInputType.numberWithOptions(
                signed: false,
              ),
              acaoTeclado: TextInputAction.next,
              // validador: (v){}
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: BotaoDropdownWidget<TipoOferta>(
              valor: widget.tipoOferta,
              aoAlterar: widget.aoAlterarTipoOferta,
              mapeamento: Mapeamentos.labelsDropdown,
              raioBorda: 8,
              dica: 'Tipo da oferta',
              possuiErro: widget.msgErroTipoOferta != null &&
                  widget.msgErroTipoOferta!.isNotEmpty,
            ),
          ),
          if (widget.msgErroTipoOferta != null &&
              widget.msgErroTipoOferta!.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 18, top: 7.5),
              child: Text(
                widget.msgErroTipoOferta!,
                style: TextStyle(
                  fontSize: 12,
                  color: Cores.vermelhoErro,
                ),
              ),
            )
        ],
      ),
    );
  }
}
