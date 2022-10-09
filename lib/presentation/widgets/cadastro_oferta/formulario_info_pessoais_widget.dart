import 'package:easylanche/presentation/widgets/shared/campo_texto_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormularioInfoPessoaisWidget extends StatefulWidget {
  final TextEditingController nomeCtrl;
  final TextEditingController telefoneCtrl;
  final GlobalKey<FormState> chaveForm;

  const FormularioInfoPessoaisWidget({
    Key? key,
    required this.nomeCtrl,
    required this.telefoneCtrl,
    required this.chaveForm,
  }) : super(key: key);

  @override
  State<FormularioInfoPessoaisWidget> createState() =>
      _FormularioInfoPessoaisWidgetState();
}

class _FormularioInfoPessoaisWidgetState
    extends State<FormularioInfoPessoaisWidget> {
  final mascaraTelefone = MaskTextInputFormatter(
    mask: '(84) ##### ####',
    type: MaskAutoCompletionType.eager,
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.chaveForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'Dados pessoais',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: CampoTextoWidget(
                textoLabel: "Nome",
                controlador: widget.nomeCtrl,
                tipo: TextInputType.name,
                acaoTeclado: TextInputAction.next,
                validador: (n) {
                  if (n == null || n.isEmpty) {
                    return 'Informe seu nome';
                  }
                  return null;
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: CampoTextoWidget(
                textoLabel: "Telefone",
                controlador: widget.telefoneCtrl,
                tipo: TextInputType.number,
                mascara: mascaraTelefone,
                acaoTeclado: TextInputAction.next,
                validador: (t) {
                  if (t == null || t.isEmpty) {
                    return 'Informe seu telefone';
                  }
                  return null;
                }),
          ),
        ],
      ),
    );
  }
}
