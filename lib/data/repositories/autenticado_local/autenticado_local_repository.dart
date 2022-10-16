import 'dart:convert';

import 'package:easylanche/core/constants/storage_keys.dart';
import 'package:easylanche/data/models/usuario/usuario.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AutenticadoLocalRepository {
  final FlutterSecureStorage storage;
  AutenticadoLocalRepository(this.storage);

  Future<Usuario?> buscarUsuario() async {
    try {
      final usuarioSerializado = await storage.read(key: StorageKeys.usuario);
      if (usuarioSerializado == null) return null;
      final usuarioMap = json.decode(usuarioSerializado);
      return Usuario.fromStorage(usuarioMap);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> limparCredenciais() async {
    await storage.delete(key: StorageKeys.usuario);
    await storage.delete(key: StorageKeys.tokenAutenticado);
  }

  Future<void> salvar(Usuario usuario, String token) async {
    await storage.write(
      key: StorageKeys.usuario,
      value: json.encode(usuario.toStorage(usuario)),
    );
    await storage.write(
      key: StorageKeys.tokenAutenticado,
      value: token,
    );
  }

  Future<String?> buscarToken() async {
    try {
      return await storage.read(key: StorageKeys.tokenAutenticado);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
