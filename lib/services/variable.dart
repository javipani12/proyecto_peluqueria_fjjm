import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

Usuario? usuario;
Peluqueria? peluqueria;
List<Peluquero>? peluqueros;
List<Servicios>? servicios;
DateTime? fecha;
TimeOfDay? hora;

final Map<String, dynamic> info = <String, dynamic>{
  'usuario' : Usuario,
  'peluqueria': <Peluqueria>[].toList(growable: true),
  'peluqueros': <Peluquero>[].toList(growable: true),
  'servicios': <Servicio>[].toList(growable: true),
  'dia': <DateTime>[].toList(growable: true),
  'hora': <TimeOfDay>[].toList(growable: true),
};