import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class UsuariosServices extends ChangeNotifier {
  final String _baseURL =
      'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Usuario> usuarios = [];

  Usuario? usuarioSeleccionado;

  bool isLoading = true;
  bool isSaving = false;

  UsuariosServices() {
    this.loadUsuarios();
  }

  Future<List<Usuario>> loadUsuarios() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'usuarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> usuariosMap = json.decode(resp.body);

    usuariosMap.forEach((key, value) {
      final tempUsuario = Usuario.fromMap(value);
      tempUsuario.id = key;
      this.usuarios.add(tempUsuario);
    });

    for (int i = 0; i < this.usuarios.length; i++) {
      print(this.usuarios[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.usuarios;
  }

  Future saveOrCreateUsuario(Usuario usuario) async {
    isSaving = true;
    notifyListeners();

    if (usuario.id == null) {
      // Crear
      await this.createUsuario(usuario);
    } else {
      // Actualizar
      await this.updateUsuario(usuario);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateUsuario(Usuario usuario) async {
    final url = Uri.https(_baseURL, 'usuarios/${usuario.id}.json');
    final resp = await http.put(url, body: usuario.toJson());
    final decodedData = resp.body;

    final index =
        this.usuarios.indexWhere((element) => element.id == usuario.id);
    this.usuarios[index] = usuario;

    return usuario.id!;
  }

  Future<String> createUsuario(Usuario usuario) async {
    final url = Uri.https(_baseURL, 'usuarios/${usuario.id}.json');
    final resp = await http.post(url, body: usuario.toJson());
    final decodedData = json.decode(resp.body);

    usuario.id = decodedData['name'];

    print('${usuario.id}');

    usuarios.add(usuario);

    return usuario.id ?? 'default';
  }
}
