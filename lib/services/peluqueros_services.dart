import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class PeluquerosServices extends ChangeNotifier{
  final String _baseURL = 'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Peluquero> peluqueros =  [];

  bool isLoading = true;
  bool isSaving = false;

  PeluquerosServices(){
    this.loadPeluqueros();
  }

  Future<List<Peluquero>> loadPeluqueros() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'peluqueros.json');
    final resp = await http.get(url);

    final Map<String, dynamic> PelquerosMap = json.decode(resp.body);
    
    PelquerosMap.forEach((key, value) { 
      final tempPeluquero = Peluquero.fromMap(value);
      tempPeluquero.id = key;
      this.peluqueros.add(tempPeluquero);
    });

    for(int i = 0; i < this.peluqueros.length; i++){
      print(this.peluqueros[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.peluqueros;
  }
}