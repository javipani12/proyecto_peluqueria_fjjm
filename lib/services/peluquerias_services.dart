import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class PeluqueriaServices extends ChangeNotifier{
  final String _baseURL = 'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Peluqueria> peluquerias =  [];

  Peluqueria? peluqueriaSeleccionada;

  bool isLoading = true;
  bool isSaving = false;

  PeluqueriaServices(){
    this.loadPeluqueria();
  }

  Future<List<Peluqueria>> loadPeluqueria() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'peluquerias.json');
    final resp = await http.get(url);

    final Map<String, dynamic> peluqueriaMap = json.decode(resp.body);
    
    peluqueriaMap.forEach((key, value) { 
      final tempPeluqueria = Peluqueria.fromMap(value);
      tempPeluqueria.id = key;
      this.peluquerias.add(tempPeluqueria);
    });

    for(int i = 0; i < this.peluquerias.length; i++){
      print(this.peluquerias[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.peluquerias;
  }
}