import 'package:flutter/material.dart';

class AppBarVaziaWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color corStatusBar;

  const AppBarVaziaWidget({
    Key? key,
    required this.corStatusBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: corStatusBar);
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
