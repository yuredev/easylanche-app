import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

class TopoPerfilWidget extends StatelessWidget {
  const TopoPerfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanhoCover = MediaQuery.of(context).size.height  * 0.22;
    return SizedBox(
      height:tamanhoCover + 150 / 2,
      child: Stack(
        children: [
          Container(
            height: tamanhoCover,
            margin: const EdgeInsets.only(bottom: 70),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 230, 141, 6),
                  Cores.laranjaPrincipal
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: tamanhoCover - 150 / 2,
            left: (MediaQuery.of(context).size.width / 2) - 150 / 2,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(child: Icon(Icons.person, color: Colors.grey,)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
