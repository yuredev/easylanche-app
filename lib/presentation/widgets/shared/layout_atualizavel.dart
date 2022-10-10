import 'package:flutter/material.dart';

class LayoutAtualizavel extends StatelessWidget {
  final Future<void> Function() aoAtualizar;
  final Widget child;

  const LayoutAtualizavel({
    Key? key,
    required this.aoAtualizar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: aoAtualizar,
      child: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}

