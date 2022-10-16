import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
import 'package:easylanche/presentation/widgets/shared/barra_pesquisa.dart';
import 'package:easylanche/presentation/widgets/shared/easylanche_scaffold.dart';
import 'package:easylanche/presentation/widgets/shared/layout_atualizavel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/feed/card_oferta_widget.dart';

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    context.read<ListagemOfertaCubit>().listar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasylancheScaffold(
      child: LayoutAtualizavel(
        aoAtualizar: () async {
          context.read<ListagemOfertaCubit>().listar();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Icon(
                        Icons.fastfood,
                        size: 28,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      'EasyLanche',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Cores.laranjaPrincipal,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(70),
                          onTap: () {
                            Navigator.pushNamed(context, Rotas.cadastroOferta);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18),
                child: BlocBuilder<ListagemOfertaCubit, ListagemOfertaState>(
                  builder: (context, state) {
                    if (state is ErroAoListarOfertasState) {
                      return Center(
                        child: Text('Erro ao exibir ofertas'),
                      );
                    }
                    if (state is ListandoOfertasState) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            5,
                            (index) => Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: CardOfertaWidget(
                                titulo: 'oferta.nome',
                                subtitulo: 'oferta.descricao',
                                valor: 5,
                                isCarregando: true,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is OfertasListadasState) {
                      return state.ofertas.isEmpty
                          ? Center(
                              child: Text("Nenhuma Postagem"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.ofertas.length,
                              itemBuilder: (ctx, index) {
                                final oferta = state.ofertas[index];
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: CardOfertaWidget(
                                    titulo: oferta.descricao,
                                    subtitulo: 'Vendido por ' + oferta.nome,
                                    valor: oferta.valor,
                                    tipoOferta: oferta.tipo,
                                    aoPressionar: () {},
                                  ),
                                );
                              },
                            );
                    }

                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
