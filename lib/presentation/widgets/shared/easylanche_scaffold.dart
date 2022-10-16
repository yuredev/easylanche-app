import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/presentation/widgets/shared/appbar_vazia.dart';
import 'package:flutter/material.dart';

class EasylancheScaffold extends StatelessWidget {
  final Color corStatusBar;
  final Widget child;
  final Widget? drawerDireita;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const EasylancheScaffold({
    Key? key,
    required this.child,
    this.corStatusBar = Cores.laranjaPrincipal,
    this.drawerDireita,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVaziaWidget(corStatusBar: corStatusBar),
      body: child,
      endDrawer: drawerDireita,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
