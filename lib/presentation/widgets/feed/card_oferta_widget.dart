import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardOfertaWidget extends StatelessWidget {
  final String title;
  final String descricao;
  final double value;

  CardOfertaWidget({
    required this.title,
    required this.descricao,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.blue[700]!,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
            Row(children: [
              Text(
                descricao,
                style: TextStyle(fontFamily: 'Open Sans'),
              )
            ])
          ],
        ),
      ),
    );
  }
}
