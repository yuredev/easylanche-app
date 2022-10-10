import 'package:flutter/material.dart';

class ConfiguracaoAmbiente {
  final String urlAPI;

  const ConfiguracaoAmbiente({
    required this.urlAPI,
  });
}

class Ambiente extends InheritedWidget {
  final ConfiguracaoAmbiente cofiguracoes;

  const Ambiente(
    this.cofiguracoes, {
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum TipoAmbiente { dev, homologacao, producao }

Map<TipoAmbiente, String> ambienteLabels = {
  TipoAmbiente.dev: 'DEV',
  TipoAmbiente.homologacao: 'HOMOLOG',
  TipoAmbiente.producao: 'PROD'
};
