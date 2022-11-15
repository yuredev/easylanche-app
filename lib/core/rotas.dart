import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/usuario/submissao/submissao_usuario_cubit.dart';
import 'package:easylanche/presentation/pages/cadastro_oferta_page.dart';
import 'package:easylanche/presentation/pages/cadastro_usuario_page.dart';
import 'package:easylanche/presentation/pages/feed_page.dart';
import 'package:easylanche/presentation/pages/login_page.dart';
import 'package:easylanche/presentation/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../presentation/pages/info_oferta_page.dart';

abstract class Rotas {
  static const feed = '/feed';
  static const cadastroOferta = '/cadastro-oferta';
  static const cadastroUsuario = '/cadastro-usuario';
  static const login = '/login';
  static const perfil = '/perfil';
  static const infoOferta = '/info-oferta';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Rotas.feed:
        return MaterialPageRoute(
          builder: (ctx) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ListagemOfertaCubit>.value(
                  value: GetIt.I.get(),
                ),
                BlocProvider<AutenticacaoCubit>.value(
                  value: GetIt.I.get(),
                ),
                BlocProvider<SubmissaoUsuarioCubit>.value(
                  value: GetIt.I.get(),
                ),
              ],
              child: FeedPage(),
            );
          },
        );
      case Rotas.cadastroOferta:
        return MaterialPageRoute(
          builder: (ctx) {
            return BlocProvider<SubmissaoOfertaCubit>.value(
              value: GetIt.I.get(),
              child: CadastroOfertaPage(
                  oferta: settings.arguments == null
                      ? null
                      : (settings.arguments as Map)['oferta']),
            );
          },
        );
      case Rotas.login:
        return MaterialPageRoute(
          builder: (ctx) {
            return BlocProvider<AutenticacaoCubit>.value(
              value: GetIt.I.get(),
              child: LoginPage(),
            );
          },
        );
      case Rotas.cadastroUsuario:
        return MaterialPageRoute(
          builder: (ctx) {
            return BlocProvider<SubmissaoUsuarioCubit>.value(
              value: GetIt.I.get(),
              child: CadastroUsuarioPage(),
            );
          },
        );
      case Rotas.perfil:
        return MaterialPageRoute(
          builder: (ctx) {
            return BlocProvider<SubmissaoUsuarioCubit>.value(
              value: GetIt.I.get(),
              child: PerfilPage(),
            );
          },
        );
      case Rotas.infoOferta:
        return MaterialPageRoute(
          builder: (ctx) {
            return BlocProvider<SubmissaoUsuarioCubit>.value(
              value: GetIt.I.get(),
              child: InfoOfertaPage(),
            );
          },
        );
    }
    return null;
  }
}
