import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_cubit.dart';
import 'package:easylanche/logic/cubits/autenticacao/autenticacao_state.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
import 'package:easylanche/presentation/widgets/feed/appbar_feed_widget.dart';
import 'package:easylanche/presentation/widgets/feed/botao_ativo_widget.dart';
import 'package:easylanche/presentation/widgets/feed/drawer_conta_widget.dart';
import 'package:easylanche/presentation/widgets/shared/barra_pesquisa.dart';
import 'package:easylanche/presentation/widgets/shared/easylanche_scaffold.dart';
import 'package:easylanche/presentation/widgets/shared/ilustracao_widget.dart';
import 'package:easylanche/presentation/widgets/shared/layout_atualizavel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

import '../widgets/feed/card_oferta_widget.dart';

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final controladorBarraBusca = TextEditingController();
  TipoOferta? tipoSelecionado;

  @override
  void initState() {
    context.read<ListagemOfertaCubit>().listar();
    super.initState();
  }

  List<Oferta> getOfertasFiltradas(List<Oferta> ofertas) {
    final filtradas = controladorBarraBusca.text.isEmpty
        ? ofertas
        : ofertas
            .where((of) => of.titulo
                .toLowerCase()
                .startsWith(controladorBarraBusca.text.toLowerCase()))
            .toList();
    return tipoSelecionado == null
        ? filtradas
        : filtradas.where((of) => of.tipo == tipoSelecionado).toList();
  }

  @override
  Widget build(BuildContext context) {
    return EasylancheScaffold(
      drawer: DrawerContaWidget(),
      floatingActionButton: BlocBuilder<AutenticacaoCubit, AutenticacaoState>(
        builder: (context, state) => state is UsuarioLogadoState
            ? FloatingActionButton(
                backgroundColor: Cores.laranjaPrincipal,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  Rotas.cadastroOferta,
                ),
              )
            : SizedBox(),
      ),
      child: LayoutAtualizavel(
        aoAtualizar: () async {
          context.read<ListagemOfertaCubit>().listar();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: AppBarFeedWidget(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      'O que você quer comer hoje?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: BarraPesquisaWidget(
                      rotulo: 'Pesquisar',
                      controlador: controladorBarraBusca,
                      aoAlterar: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              height: 107,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 19, left: 30),
                    child: BotaoAtivoWidget(
                      aoPressionar: () {
                        setState(() {
                          tipoSelecionado =
                              tipoSelecionado == TipoOferta.salgado
                                  ? null
                                  : TipoOferta.salgado;
                        });
                      },
                      caminhoImagem: 'assets/images/salgado.jpg',
                      titulo: 'Salgados',
                      isAtivo: tipoSelecionado == TipoOferta.salgado,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 19),
                    child: BotaoAtivoWidget(
                      aoPressionar: () {
                        setState(() {
                          tipoSelecionado = tipoSelecionado == TipoOferta.doce
                              ? null
                              : TipoOferta.doce;
                        });
                      },
                      caminhoImagem: 'assets/images/doce.png',
                      titulo: 'Doces',
                      isAtivo: tipoSelecionado == TipoOferta.doce,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 19),
                    child: BotaoAtivoWidget(
                      aoPressionar: () {
                        setState(() {
                          tipoSelecionado = tipoSelecionado == TipoOferta.bebida
                              ? null
                              : TipoOferta.bebida;
                        });
                      },
                      caminhoImagem: 'assets/images/bebida.png',
                      titulo: 'Bebidas',
                      isAtivo: tipoSelecionado == TipoOferta.bebida,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: BotaoAtivoWidget(
                      aoPressionar: () {
                        setState(() {
                          tipoSelecionado = tipoSelecionado == TipoOferta.outro
                              ? null
                              : TipoOferta.outro;
                        });
                      },
                      caminhoImagem: 'assets/images/outros.png',
                      titulo: 'Outros',
                      isAtivo: tipoSelecionado == TipoOferta.outro,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 22),
                    child:
                        BlocBuilder<ListagemOfertaCubit, ListagemOfertaState>(
                      builder: (context, state) {
                        if (state is ErroAoListarOfertasState) {
                          return IlustracaoWidget(
                            nomeIlustracao: 'network-error.json',
                            titulo: 'Erro ao exibir as ofertas',
                            subtitulo: state.isErroConexao
                                ? 'Ocorreu um erro ao buscar as ofertas do servidor'
                                : 'Ocorreu um erro inesperado ao buscar as ofertas',
                            isAnimacao: true,
                            larguraImagem:
                                MediaQuery.of(context).size.width * 0.42,
                            tamanhoFonte: 17,
                            alinhamentoSubtitulo: TextAlign.center,
                            alinhamentoTitulo: TextAlign.center,
                          );
                        }
                        if (state is ListandoOfertasState) {
                          return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              5,
                              (index) => Container(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: CardOfertaWidget(isCarregando: true),
                              ),
                            ),
                          );
                        }
                        if (state is OfertasListadasState) {
                          final ofertas = getOfertasFiltradas(state.ofertas);
                          return ofertas.isEmpty
                              ? Center(
                                  child: IlustracaoWidget(
                                  nomeIlustracao: 'sem_dados.png',
                                  titulo:
                                      'Nenhuma resultado',
                                  larguraImagem:
                                      MediaQuery.of(context).size.width * 0.5,
                                  distanciaTextoImagem: 5,
                                  alinhamentoSubtitulo: TextAlign.center,
                                  alinhamentoTitulo: TextAlign.center,
                                  tamanhoFonte: 17.5,
                                ))
                              : BlocBuilder<AutenticacaoCubit,
                                  AutenticacaoState>(
                                  builder: (ctx, authState) => ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: ofertas.length,
                                    itemBuilder: (ctx, index) {
                                      final oferta = ofertas[index];
                                      return Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: Slidable(
                                          enabled:
                                              authState is UsuarioLogadoState &&
                                                  authState.usuarioLogado.id ==
                                                      oferta.usuario?.id,
                                          endActionPane: ActionPane(
                                            extentRatio: 0.25,
                                            motion: ScrollMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (ctx) async {
                                                  // TODO: isso aqui tá ruim, tem que botar dentro de um cubit
                                                  final deveExcluir =
                                                      (await AlertUtils
                                                              .mostrarDialogSimNao(
                                                            context,
                                                            titulo:
                                                                'Remover oferta?',
                                                            descricao:
                                                                'Esta ação removerá definitavamente sua oferta',
                                                            aoConfirmar: () {},
                                                          ) ??
                                                          false);
                                                  if (deveExcluir) {
                                                    try {
                                                      AlertUtils
                                                          .mostrarCarregamento(
                                                              context,
                                                              texto:
                                                                  'Removendo oferta...');
                                                      await GetIt.I
                                                          .get<
                                                              OfertaRepository>()
                                                          .remover(oferta.id!);
                                                      Navigator.pop(context);
                                                      AlertUtils
                                                          .mostrarSnackBar(
                                                        context,
                                                        'Oferta removida com sucesso!',
                                                      );
                                                      context
                                                          .read<
                                                              ListagemOfertaCubit>()
                                                          .listar();
                                                    } catch (e) {
                                                      Navigator.pop(context);
                                                      AlertUtils.mostrarSnackBar(
                                                          context,
                                                          'Erro ao remover oferta',
                                                          isMensagemErro: true);
                                                    }
                                                  }
                                                },
                                                backgroundColor:
                                                    Colors.transparent,
                                                foregroundColor:
                                                    Cores.vermelhoErro,
                                                icon: Icons.delete,
                                                label: 'Excluir',
                                              ),
                                            ],
                                          ),
                                          child: CardOfertaWidget(
                                            oferta: oferta,
                                            aoPressionar: () {
                                              if (authState
                                                      is UsuarioLogadoState &&
                                                  oferta.usuario!.id ==
                                                      authState
                                                          .usuarioLogado.id) {
                                                Navigator.pushNamed(
                                                  context,
                                                  Rotas.cadastroOferta,
                                                  arguments: {'oferta': oferta},
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                        }

                        return SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
