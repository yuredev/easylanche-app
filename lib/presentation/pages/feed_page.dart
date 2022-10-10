import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EasyLanche",
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        elevation: 0.00,
        backgroundColor: Cores.laranjaPrincipal,
      ), //
      body: LayoutAtualizavel(
        aoAtualizar: () async {
          context.read<ListagemOfertaCubit>().listar();
        },
        child: BlocBuilder<ListagemOfertaCubit, ListagemOfertaState>(
          builder: (context, state) {
            if (state is ErroAoListarOfertasState) {}
            if (state is ListandoOfertasState) {
              return Container(
                padding: EdgeInsets.fromLTRB(12, 16, 12, 32),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    5,
                    (index) => Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: CardOfertaWidget(
                        titulo: 'oferta.nome',
                        descricao: 'oferta.descricao',
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
                  : Container(
                      padding: EdgeInsets.fromLTRB(12, 16, 12, 32),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.ofertas.length,
                        itemBuilder: (ctx, index) {
                          final oferta = state.ofertas[index];
                          return Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: CardOfertaWidget(
                              titulo: oferta.nome,
                              descricao: oferta.descricao,
                              valor: oferta.valor,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cores.laranjaPrincipal,
        onPressed: () {
          Navigator.pushNamed(context, Rotas.cadastroOferta);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
