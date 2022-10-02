import 'package:flutter/material.dart';


abstract class AlertUtils {
  static void mostrarSnackBar(
    BuildContext context,
    String mensagem, {
    bool isMensagemErro = false,
    bool fecharAtual = true,
  }) {
    const maxChars = 150;
    if (mensagem.length > maxChars) {
      mensagem = mensagem.substring(0, maxChars - 1);
      mensagem += '...';
    }
    if (fecharAtual) ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensagem),
      duration: Duration(seconds: 3),
      backgroundColor: isMensagemErro ? Colors.red : null,
    ));
  }

  static void mostrarCarregamento(BuildContext context, {String? texto}) {
    showDialog(
      context: context,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(child: CircularProgressIndicator()),
                      if (texto?.isNotEmpty ?? false)
                        Container(
                          margin: const EdgeInsets.only(top: 18),
                          width: MediaQuery.of(context).size.width * .65,
                          child: Text(
                            texto!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<bool?> mostrarDialogSimNao<T>(
    BuildContext context, {
    required String titulo,
    required String descricao,
    String textoConfirmacao = 'Sim',
    String textoCancelamento = 'Não',
    void Function()? aoConfirmar,
    String tituloConfirmacao = 'Sim',
    String tituloCancelamento = 'Não',
    Color? corConfirmacao,
    Color? corCancelamento,
    bool isDismissable = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: isDismissable, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titulo,
            style: TextStyle(color: corCancelamento),
          ),
          content: SingleChildScrollView(child: Text(descricao)),
          actions: <Widget>[
            TextButton(
              child: Text(
                tituloCancelamento,
                style: TextStyle(color: corCancelamento),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text(
                tituloConfirmacao,
                style: TextStyle(color: corConfirmacao),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
                if (aoConfirmar != null) aoConfirmar();
              },
            ),
          ],
        );
      },
    );
    return result;
  }
}
