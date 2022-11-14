import 'package:easylanche/presentation/widgets/perfil/Topo_perfil_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/constants/cores.dart';
import '../widgets/feed/card_oferta_widget.dart';
import '../widgets/perfil/card_oferta_perfil_widget.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 1, child: TopoPerfilWidget()),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Joao da Silva",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 280,
                    child: Text(
                      "Sou aluno de informática da turma de if21 e eu vendo salgados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "3 Ofertas",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 320,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          heroTag: 'Seguir',
                          elevation: 0,
                          hoverColor: Colors.grey,
                          label: const Text(
                            "Seguir",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          icon: const Icon(Icons.person_add),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        3,
        (index) => Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: CardOfertaPerfilWidget(
            titulo: 'Nome da oferta',
            valor: 5,
          ),
        ),
      ),
    );
  }
}
