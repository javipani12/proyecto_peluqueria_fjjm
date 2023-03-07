import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class CalendariosServices extends ChangeNotifier {
  final String _baseURL =
      'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Calendario> calendarios = [];

  Calendario? calendarioSeleccionado;

  bool isLoading = true;
  bool isSaving = false;

  CalendariosServices() {
    loadCalendario();
  }

  Future<List<Calendario>> loadCalendario() async {
    final url = Uri.https(_baseURL, 'calendario.json');
    final resp = await http.get(url);

    final Map<String, dynamic> calendariosMap = json.decode(resp.body);

    calendariosMap.forEach((key, value) {
      final tempCalendario = Calendario.fromMap(value);
      tempCalendario.id = key;
      calendarios.add(tempCalendario);
    });

    for (int i = 0; i < calendarios.length; i++) {
      print(calendarios[i].id);
    }

    isLoading = false;
    notifyListeners();

    return calendarios;
  }

  Future saveOrCreateCalendario(Calendario calendario) async {
    isSaving = true;
    notifyListeners();

    if (calendario.id == null) {
      // Crear
      await createCalendario(calendario);
    } else {
      // Actualizar
      await updateCalendario(calendario);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateCalendario(Calendario calendario) async {
    final url = Uri.https(_baseURL, 'calendario/${calendario.id}.json');
    final resp = await http.put(url, body: calendario.toJson());
    final decodedData = resp.body;

    final index =
        calendarios.indexWhere((element) => element.id == calendario.id);
    calendarios[index] = calendario;

    return calendario.id!;
  }

  Future<String> createCalendario(Calendario calendario) async {
    final url = Uri.https(_baseURL, 'calendario.json');
    final resp = await http.post(url, body: calendario.toJson());
    final decodedData = json.decode(resp.body);

    calendario.id = decodedData['email'];

    print('${calendario.id}');

    calendarios.add(calendario);

    return calendario.id ?? 'default';
  }
}
