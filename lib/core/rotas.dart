import 'package:easylanche/presentation/pages/feed_page.dart';
import 'package:flutter/material.dart';

abstract class Rotas {
  static const feed = '/feed';
  static const cadastroOferta = '/cadastro-oferta';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Rotas.feed:
        return MaterialPageRoute(
          builder: (ctx) {
            return FeedPage();
          },
        );
      case Rotas.cadastroOferta:
        return MaterialPageRoute(
          builder: (ctx) {
            return SizedBox();
          },
        );
    }
  }
}
