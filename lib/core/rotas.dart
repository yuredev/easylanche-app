import 'package:easylanche/logic/cubits/alertas_app/alertas_app_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:easylanche/presentation/pages/cadastro_oferta_page.dart';
import 'package:easylanche/presentation/pages/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
            return BlocProvider<SubmissaoOfertaCubit>.value(
              value: GetIt.I.get(),
              child: CadastroOfertaPage(),
            );
          },
        );
    }
    return null;
  }
}
