import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/core/utils/alert_utils.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:easylanche/data/repositories/oferta/oferta_repository.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/listagem/listagem_oferta_state.dart';
import 'package:easylanche/presentation/widgets/feed/card_oferta_widget.dart';
import 'package:easylanche/presentation/widgets/shared/Topo_widget.dart';
import 'package:easylanche/presentation/widgets/shared/ilustracao_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';


class PerfilPage extends StatelessWidget {
  final Usuario usuario;

  const PerfilPage({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanhoCover = MediaQuery.of(context).size.height * 0.22;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopoPerfilWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    usuario.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  // SizedBox(
                  //   width: 280,
                  //   child: Text(
                  //     usuario,
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       color: Colors.grey,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(
                  //   width: 320,
                  //   child: FloatingActionButton.extended(
                  //     onPressed: null,
                  //     heroTag: 'Seguir',
                  //     elevation: 0,
                  //     hoverColor: Colors.grey,
                  //     label: const Text(
                  //       "Seguir",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w900,
                  //       ),
                  //     ),
                  //     icon: const Icon(Icons.person_add),
                  //   ),
                  // ),
                  _ListaOfertasWidget(usuario: usuario),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaOfertasWidget extends StatelessWidget {
  final Usuario usuario;

  const _ListaOfertasWidget({Key? key, required this.usuario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListagemOfertaCubit, ListagemOfertaState>(
      builder: (context, state) {
        if (state is ErroAoListarOfertasState) {
          return IlustracaoWidget(
            nomeIlustracao: 'network-error.json',
            titulo: 'Erro ao exibir as ofertas',
            subtitulo: state.isErroConexao
                ? 'Ocorreu um erro ao buscar as ofertas do servidor'
                : 'Ocorreu um erro inesperado ao buscar as ofertas',
            isAnimacao: true,
            larguraImagem: MediaQuery.of(context).size.width * 0.42,
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
          return state.ofertas.isEmpty
              ? Center(
                  child: IlustracaoWidget(
                  nomeIlustracao: 'sem_dados.png',
                  titulo: 'Nenhuma postagem realizada no dia de hoje',
                  subtitulo:
                      'Incentive seu amigo vendedor a utilizar o EasyLanche',
                  larguraImagem: MediaQuery.of(context).size.width * 0.5,
                  distanciaTextoImagem: 5,
                  alinhamentoSubtitulo: TextAlign.center,
                  alinhamentoTitulo: TextAlign.center,
                  tamanhoFonte: 17.5,
                ))
              : Column(
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "${state.ofertas.where((e) => e.usuario == usuario).length} Ofertas",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.ofertas
                          .where((e) => e.usuario == usuario)
                          .length,
                      itemBuilder: (ctx, index) {
                        final oferta = state.ofertas
                            .where((e) => e.usuario == usuario)
                            .toList()[index];
                        return Container(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.25,
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) async {
                                    // TODO: isso aqui tá ruim, tem que botar dentro de um cubit
                                    final deveExcluir =
                                        (await AlertUtils.mostrarDialogSimNao(
                                              context,
                                              titulo: 'Remover oferta?',
                                              descricao:
                                                  'Esta ação removerá definitavamente sua oferta',
                                              aoConfirmar: () {},
                                            ) ??
                                            false);
                                    if (deveExcluir) {
                                      try {
                                        AlertUtils.mostrarCarregamento(context,
                                            texto: 'Removendo oferta...');
                                        await GetIt.I
                                            .get<OfertaRepository>()
                                            .remover(oferta.id!);
                                        Navigator.pop(context);
                                        AlertUtils.mostrarSnackBar(
                                          context,
                                          'Oferta removida com sucesso!',
                                        );
                                        context
                                            .read<ListagemOfertaCubit>()
                                            .listar();
                                      } catch (e) {
                                        Navigator.pop(context);
                                        AlertUtils.mostrarSnackBar(
                                            context, 'Erro ao remover oferta',
                                            isMensagemErro: true);
                                      }
                                    }
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Cores.vermelhoErro,
                                  icon: Icons.delete,
                                  label: 'Excluir',
                                ),
                              ],
                            ),
                            child: CardOfertaWidget(
                              oferta: oferta,
                              aoPressionar: () {
                                Navigator.pushNamed(
                                  context,
                                  Rotas.cadastroOferta,
                                  arguments: {'oferta': oferta},
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
        }

        return SizedBox();
      },
    );
  }
}
