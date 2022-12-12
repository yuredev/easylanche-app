import 'package:easylanche/logic/cubits/usuario/relacionamento/relacionamento_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RelacionamentoCubit extends Cubit<RelacionamentoState> {
  RelacionamentoCubit() : super(InitialRelacionamentoState());

  Future<void> seguir(int idUsuario) async {
    try {
      emit(CarregandoSeguirUsuario());
      final prefs = await SharedPreferences.getInstance();
      final idsUsuario = prefs.getStringList('seguidos') ?? [];
      if (!idsUsuario.contains(idUsuario.toString())) {
        idsUsuario.add(idUsuario.toString());
      }
      await prefs.setStringList('seguidos', idsUsuario);
      emit(UsuarioSeguidoSucessoState());
    } catch (e) {
      print(e);
      emit(ErroSeguimentoUsuarioState());
    }
  }

  Future<void> pararDeSeguir(int idUsuario) async {
    try {
      emit(CarregandoSeguirUsuario());
      final prefs = await SharedPreferences.getInstance();
      final idsUsuario = prefs.getStringList('seguidos') ?? [];
      if (idsUsuario.contains(idUsuario.toString())) {
        idsUsuario.remove(idUsuario.toString());
      }
      await prefs.setStringList('seguidos', idsUsuario);
      emit(UsuarioParouDeSeguirSucessoState());
    } catch (e) {
      print(e);
      emit(ErroSeguimentoUsuarioState());
    }
  }

  Future<void> consultarUsuarioSeguido(int idUsuario) async {
    try {
      emit(ConsultandoUsuarioSeguidoState());
      final prefs = await SharedPreferences.getInstance();
      final idsUsuario = prefs.getStringList('seguidos')!;
      emit(UsuarioSeguidoState(idsUsuario.contains(idUsuario.toString())));
    } catch (e) {
      debugPrint(e.toString());
      emit(ErroSeguimentoUsuarioState());
    }
  }
}
