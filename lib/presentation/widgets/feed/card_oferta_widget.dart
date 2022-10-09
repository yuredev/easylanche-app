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
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 239, 236),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/salgado.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
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
                        Text(title,
                            style: TextStyle(
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    Text(descricao,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        )),
                    Text("R\$ ${value.toString()}0",
                        style: TextStyle(
                          height: 2,
                          fontSize: 15,
                          color: Colors.green[300],
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
