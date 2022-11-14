import 'package:easylanche/presentation/widgets/shared/Topo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/cores.dart';
import '../../core/rotas.dart';
import '../../logic/cubits/autenticacao/autenticacao_cubit.dart';
import '../../logic/cubits/autenticacao/autenticacao_state.dart';
import '../widgets/feed/card_oferta_widget.dart';
import '../widgets/feed/drawer_conta_widget.dart';
import '../widgets/perfil/card_oferta_perfil_widget.dart';
import '../widgets/shared/easylanche_scaffold.dart';

class InfoOfertaPage extends StatelessWidget {
  const InfoOfertaPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EasylancheScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: TopoPerfilWidget()),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Vendido por ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Rotas.perfil,
                        ),
                        child: Text(
                          'Fulano',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 280,
                    child: Text(
                      "Local: Prédio de Informatica",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.watch_later),
                      Text(
                        "10:50 AM",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 320,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          heroTag: 'whatsApp',
                          elevation: 0,
                          hoverColor: Colors.grey,
                          label: const Text(
                            "Chamar no WhatsApp",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          icon: const Icon(Icons.whatsapp),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
