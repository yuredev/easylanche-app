import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarraPesquisaWidget extends StatefulWidget {
  final String? rotulo;
  final void Function(String)? aoAlterar;
  final TextEditingController? controlador;
  final void Function()? aoClicarBotaoEnviar;
  final Color? corBotaoEnviar;
  final String? Function(String?)? validador;
  final void Function(String)? aoSubmeter;
  final TextInputAction? acaoInput;
  final GlobalKey<FormState>? chaveForm;
  final List<TextInputFormatter>? mascaras;
  final bool isTecladoCaixaAlta;
  final Color corBorda;

  const BarraPesquisaWidget({
    Key? key,
    this.controlador,
    this.chaveForm,
    this.isTecladoCaixaAlta = false,
    this.aoAlterar,
    this.rotulo,
    this.corBorda = Cores.cinzaBackground,
    this.aoClicarBotaoEnviar,
    this.validador,
    this.aoSubmeter,
    this.acaoInput,
    this.corBotaoEnviar,
    this.mascaras,
  }) : super(key: key);

  @override
  State<BarraPesquisaWidget> createState() => _BarraPesquisaWidgetState();
}

class _BarraPesquisaWidgetState extends State<BarraPesquisaWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.chaveForm,
      child: TextFormField(
        textInputAction: widget.acaoInput,
        onFieldSubmitted: widget.aoSubmeter,
        validator: widget.validador,
        controller: widget.controlador,
        onChanged: widget.aoAlterar,
        autocorrect: false,
        inputFormatters: widget.mascaras,
        textCapitalization: widget.isTecladoCaixaAlta
            ? TextCapitalization.sentences
            : TextCapitalization.none,
        style: TextStyle(
          color: Cores.cinzaSubtituloEscuro,
        ),
        enableSuggestions: false,
        decoration: InputDecoration(
          errorMaxLines: 2,
          prefixIcon: Icon(
            Icons.search,
            color: Cores.cinzaTextField,
          ),
          suffixIcon: widget.aoClicarBotaoEnviar != null
              ? IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    if (widget.chaveForm == null ||
                        widget.chaveForm != null &&
                            widget.chaveForm!.currentState!.validate()) {
                      widget.aoClicarBotaoEnviar!();
                    }
                  },
                  icon: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: widget.corBotaoEnviar ?? Color(0xffd8d8d8),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(
            left: 16.48,
            top: 18,
            bottom: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Cores.cinzaBordaInput, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Cores.cinzaBordaInput, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.rotulo,
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Cores.cinzaTextField,
          ),
        ),
      ),
    );
  }
}
