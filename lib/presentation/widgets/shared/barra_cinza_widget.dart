import 'package:flutter/material.dart';

class BarraCinzaWidget extends StatelessWidget {
  final double altura;
  final double largura;
  final double borderRadius;

  const BarraCinzaWidget({
    Key? key,
    required this.altura,
    required this.largura,
    this.borderRadius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: SizedBox(),
      ),
    );
  }
}
