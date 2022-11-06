import 'package:flutter/material.dart';

class DialogInformativoWidget extends StatelessWidget {
  final String texto;
  final String nomeImagem;

  const DialogInformativoWidget(
      {Key? key, required this.texto, required this.nomeImagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 13, top: 20),
        titlePadding: const EdgeInsets.fromLTRB(18, 27, 18, 0),
        title: Text(
          texto,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        content: Image.asset(
          'assets/images/$nomeImagem',
          height: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
