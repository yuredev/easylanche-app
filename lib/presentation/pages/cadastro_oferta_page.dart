import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_state.dart';
import 'package:easylanche/presentation/widgets/cadastro_oferta/formulario_info_pessoais_widget.dart';
import 'package:easylanche/presentation/widgets/cadastro_oferta/formulario_oferta_widget.dart';
import 'package:easylanche/presentation/widgets/shared/botao_elevado_widget.dart';
import 'package:easylanche/presentation/widgets/shared/indicador_etapa_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroOfertaPage extends StatefulWidget {
  const CadastroOfertaPage({Key? key}) : super(key: key);

  @override
  State<CadastroOfertaPage> createState() => _CadastroOfertaPageState();
}

class _CadastroOfertaPageState extends State<CadastroOfertaPage> {
  var _etapa = 1;
  int get etapa => _etapa;
  final nomeCtrl = TextEditingController();
  final telefoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final descricaoCtrl = TextEditingController();
  final nomeOfertaCtrl = TextEditingController();
  final valorCtrl = TextEditingController();
  final chaveFormOferta = GlobalKey<FormState>();
  final chaveFormInfoPessoais = GlobalKey<FormState>();
  TipoOferta? tipoOfertaSelecionado;
  String? msgErroTipoOferta;

  set etapa(int etapa) {
    if (etapa < 1 || etapa > 2) {
      return;
    }
    _etapa = etapa;
  }

  Widget buildFormularioFromEtapa() {
    switch (_etapa) {
      case 1:
        // if (descricao != null) descricaoCtrl.text = descricao!;
        // if (valor != null) valorCtrl.text = valor!;
        return FormularioOfertaWidget(
          nomeCtrl: nomeOfertaCtrl,
          chaveFormulario: chaveFormOferta,
          descricaoCtrl: descricaoCtrl,
          valorCtrl: valorCtrl,
          tipoOferta: tipoOfertaSelecionado,
          msgErroTipoOferta: msgErroTipoOferta,
          aoAlterarTipoOferta: (tipo) {
            if (tipo != null) {
              setState(() => tipoOfertaSelecionado = tipo);
            }
          },
        );
      case 2:
        // if (nome != null) nomeCtrl.text = nome!;
        // if (telefone != null) telefoneCtrl.text = telefone!;
        return FormularioInfoPessoaisWidget(
          nomeCtrl: nomeCtrl,
          telefoneCtrl: telefoneCtrl,
          chaveForm: chaveFormInfoPessoais,
        );
      default:
        return SizedBox();
    }
  }

  void aoSubmeterEt1() {
    setState(() {
      msgErroTipoOferta =
          tipoOfertaSelecionado == null ? 'Informe o tipo da sua oferta' : null;
    });
    if (chaveFormOferta.currentState!.validate() && msgErroTipoOferta == null) {
      setState(() {
        etapa++;
      });
    }
  }

  void aoSubmeterEt2() {
    if (chaveFormInfoPessoais.currentState!.validate()) {
      context.read<SubmissaoOfertaCubit>().cadastrar(
            Oferta(
              telefone: telefoneCtrl.text,
              descricao: descricaoCtrl.text,
              tipo: tipoOfertaSelecionado!,
              isAtivo: true,
              valor: double.parse(valorCtrl.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (etapa > 1) {
          setState(() => etapa--);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            children: [
              const Text('Cadastrar oferta'),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: IndicadorEtapaWidget(
                  etapa: etapa,
                  largura: 140,
                  tipoIndicadorEtapaWidget: TipoIndicadorEtapaWidget.duasEtapas,
                ),
              ),
            ],
          ),
          backgroundColor: Cores.laranjaPrincipal,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: buildFormularioFromEtapa(),
                ),
                if (etapa == 1)
                  Container(
                    margin: const EdgeInsets.only(top: 65, bottom: 30),
                    child: BotaoElevadoWidget(
                      nome: 'Continuar',
                      cor: Cores.laranjaPrincipal,
                      corTexto: Colors.white,
                      aoPressionar: aoSubmeterEt1,
                      tamanhoFonte: 18,
                      largura: double.infinity,
                      altura: 48,
                      raioBorda: 8,
                    ),
                  )
                else if (etapa == 2)
                  Container(
                    margin: const EdgeInsets.only(top: 65, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotaoElevadoWidget(
                          nome: 'Voltar',
                          cor: Colors.white,
                          corTexto: Colors.black,
                          aoPressionar: () {
                            setState(() => etapa--);
                          },
                          largura: 120,
                          altura: 48,
                          raioBorda: 8,
                          tamanhoFonte: 16,
                        ),
                        const SizedBox(width: 10),
                        BlocBuilder<SubmissaoOfertaCubit, SubmissaoOfertaState>(
                          builder: (ctx, state) {
                            return BotaoElevadoWidget(
                              nome: 'Cadastrar',
                              cor: Cores.laranjaPrincipal,
                              corTexto: Colors.white,
                              aoPressionar: aoSubmeterEt2,
                              largura: 120,
                              altura: 48,
                              raioBorda: 8,
                              tamanhoFonte: 16,
                              isCarregando: state is CadastrandoOfertaState,
                              padding: EdgeInsets.symmetric(vertical: 14),
                            );
                          },
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
