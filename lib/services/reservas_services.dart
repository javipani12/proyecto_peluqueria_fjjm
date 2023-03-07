import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class ReservasServices extends ChangeNotifier {
  final String _baseURL =
      'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Reserva> reservas = [];

  Reserva? reservaSeleccionada;

  bool isLoading = true;
  bool isSaving = false;

  ReservasServices() {
    this.loadReservas();
  }

  Future<List<Reserva>> loadReservas() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'reservas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> reservasMap = json.decode(resp.body);

    reservasMap.forEach((key, value) {
      final tempReserva = Reserva.fromMap(value);
      tempReserva.id = key;
      this.reservas.add(tempReserva);
    });

    for (int i = 0; i < this.reservas.length; i++) {
      print(this.reservas[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.reservas;
  }

  Future<String> updateReserva(Reserva reserva) async {
    final url = Uri.https(_baseURL, 'reservas/${reserva.id}.json');
    final resp = await http.put(url, body: reserva.toJson());
    final decodedData = resp.body;

    final index =
        this.reservas.indexWhere((element) => element.id == reserva.id);
    this.reservas[index] = reserva;

    return reserva.id!;
  }

  Future<String> createReserva(Reserva reserva) async {
    final url = Uri.https(_baseURL, 'reservas.json');
    final resp = await http.post(url, body: reserva.toJson());
    final decodedData = json.decode(resp.body);

    reserva.id = decodedData['idUsuario'];

    print('${reserva.id}');

    reservas.add(reserva);

    return reserva.id ?? 'default';
  }
}
