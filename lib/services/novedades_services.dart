import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class NovedadesServices extends ChangeNotifier{
  final String _baseURL = 'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Novedad> novedades =  [];

  bool isLoading = true;
  bool isSaving = false;

  NovedadesServices(){
    this.loadNovedades();
  }

  Future<List<Novedad>> loadNovedades() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'novedades.json');
    final resp = await http.get(url);

    final Map<String, dynamic> NovedadesMap = json.decode(resp.body);
    
    NovedadesMap.forEach((key, value) { 
      final tempNovedad = Novedad.fromMap(value);
      tempNovedad.id = key;
      this.novedades.add(tempNovedad);
    });

    for(int i = 0; i < this.novedades.length; i++){
      print(this.novedades[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.novedades;
  }
}