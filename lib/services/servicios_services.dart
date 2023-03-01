import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:http/http.dart' as http;

class ServiciosServices extends ChangeNotifier{
  final String _baseURL = 'proyecto-peluqueria-fjjm-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Servicio> servicios =  [];

  bool isLoading = true;
  bool isSaving = false;

  ServiciosServices(){
    this.loadServicios();
  }

  Future<List<Servicio>> loadServicios() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'servicios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> serviciosMap = json.decode(resp.body);
    
    serviciosMap.forEach((key, value) { 
      final tempServicio = Servicio.fromMap(value);
      tempServicio.id = key;
      this.servicios.add(tempServicio);
    });

    for(int i = 0; i < this.servicios.length; i++){
      print(this.servicios[i].id);
    }

    this.isLoading = false;
    notifyListeners();

    return this.servicios;
  }
}