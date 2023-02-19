import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

final Map<String, dynamic> info = <String, dynamic>{
  'peluqueria': 'pista de padel',
  'peluqueros': <Peluquero>[].toList(growable: true),
  'servicios': <Servicio>[].toList(growable: true),
  'dia': <DateTime>[].toList(growable: true),
  'hora': <TimeOfDay>[].toList(growable: true),
};
