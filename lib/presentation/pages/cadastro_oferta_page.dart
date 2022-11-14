import 'package:easylanche/core/constants/cores.dart';
import 'package:easylanche/core/enums.dart';
import 'package:easylanche/data/models/oferta/oferta.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_cubit.dart';
import 'package:easylanche/logic/cubits/oferta/submissao/submissao_oferta_state.dart';
import 'package:easylanche/presentation/widgets/cadastro_oferta/formulario_oferta_widget.dart';
import 'package:easylanche/presentation/widgets/shared/botao_elevado_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroOfertaPage extends StatefulWidget {
  final Oferta? oferta;

  const CadastroOfertaPage({Key? key, this.oferta}) : super(key: key);

  @override
  State<CadastroOfertaPage> createState() => _CadastroOfertaPageState();
}

class _CadastroOfertaPageState extends State<CadastroOfertaPage> {
  var _etapa = 1;
  int get etapa => _etapa;
  final descricaoCtrl = TextEditingController();
  final valorCtrl = TextEditingController();
  final tituloCtrl = TextEditingController();
  final chaveFormOferta = GlobalKey<FormState>();
  final chaveFormInfoPessoais = GlobalKey<FormState>();
  TipoOferta? tipoOfertaSelecionado;
  String? msgErroTipoOferta;

  @override
  void initState() {
    super.initState();
    if (isEdicao) {
      popularCampos();
    }
  }

  void popularCampos() {
    setState(() {
      descricaoCtrl.text = widget.oferta!.descricao;
      valorCtrl.text = widget.oferta!.valor.toString();
      tituloCtrl.text = widget.oferta!.titulo;
      tipoOfertaSelecionado = widget.oferta!.tipo;
    });
  }

  bool get isEdicao => widget.oferta != null;

  set etapa(int etapa) {
    if (etapa < 1 || etapa > 2) {
      return;
    }
    _etapa = etapa;
  }

  Widget buildFormularioFromEtapa() {
    switch (_etapa) {
      case 1:
        return FormularioOfertaWidget(
          tituloCtrl: tituloCtrl,
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
        return SizedBox();
      default:
        return SizedBox();
    }
  }

  void submeter() {
    setState(() {
      msgErroTipoOferta =
          tipoOfertaSelecionado == null ? 'Informe o tipo da sua oferta' : null;
    });
    if (chaveFormOferta.currentState!.validate() && msgErroTipoOferta == null) {
      context.read<SubmissaoOfertaCubit>().salvar(
            Oferta(
              titulo: tituloCtrl.text,
              descricao: descricaoCtrl.text,
              tipo: tipoOfertaSelecionado!,
              isAtivo: true,
              valor: double.parse(valorCtrl.text),
              id: widget.oferta?.id
            ),
            isEdicao,
          );
    }
  }

  void aoSubmeterEt2() {
    // if (chaveFormInfoPessoais.currentState!.validate()) {
    //   context.read<SubmissaoOfertaCubit>().cadastrar(
    //         Oferta(
    //           titulo: nomeCtrl.text,
    //           telefone: telefoneCtrl.text,
    //           descricao: descricaoCtrl.text,
    //           tipo: tipoOfertaSelecionado!,
    //           isAtivo: true,
    //           valor: double.parse(valorCtrl.text),
    //         ),
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(isEdicao ? 'Editar oferta' : 'Cadastrar oferta'),
        backgroundColor: Cores.laranjaPrincipal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: buildFormularioFromEtapa(),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 65, bottom: 30, left: 10, right: 10),
                child: BlocConsumer<SubmissaoOfertaCubit, SubmissaoOfertaState>(
                  listenWhen: (prev, cur) => cur is OfertaCadastradaState,
                  listener: (ctx, state) => Navigator.pop(context),
                  builder: (ctx, state) {
                    return BotaoElevadoWidget(
                      nome: isEdicao ? 'Atualizar' : 'Cadastrar',
                      cor: Cores.laranjaPrincipal,
                      corTexto: Colors.white,
                      aoPressionar: submeter,
                      largura: double.infinity,
                      altura: 48,
                      raioBorda: 8,
                      tamanhoFonte: 16,
                      isCarregando: state is CadastrandoOfertaState,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
