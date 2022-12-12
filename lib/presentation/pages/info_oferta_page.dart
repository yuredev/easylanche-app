import 'dart:io';

import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/presentation/widgets/shared/Topo_widget.dart';
import 'package:flutter/material.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/rotas.dart';
import '../widgets/shared/easylanche_scaffold.dart';

class InfoOfertaPage extends StatefulWidget {
  final Oferta oferta;

  const InfoOfertaPage({
    Key? key,
    required this.oferta,
  }) : super(key: key);

  @override
  State<InfoOfertaPage> createState() => _InfoOfertaPageState();
}

class _InfoOfertaPageState extends State<InfoOfertaPage> {
  @override
  void initState() {
    super.initState();
  }

  void abrirZap(int telefone) async {
    try {
      final r = await FlutterOpenWhatsapp.sendSingleMessage(telefone.toString(), '');
      print(r);
    } catch (e) {
      print(e);
      AlertUtils.mostrarSnackBar(context, 'O WhatsApp não está instalado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasylancheScaffold(
      child: Column(
        children: [
          TopoPerfilWidget(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  SizedBox(
                    width: 280,
                    child: Text(
                      widget.oferta.titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 280,
                    child: Text(
                      widget.oferta.descricao,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                          arguments: {
                            'usuario': widget.oferta.usuario,
                          },
                        ),
                        child: Text(
                          widget.oferta.usuario!.nome,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
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
                          onPressed: () {
                            abrirZap(
                                int.parse(widget.oferta.usuario!.telefone));
                          },
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
