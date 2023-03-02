import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

Usuario usuario = Usuario(
    acceptPrivacy: true,
    acceptPublicity: true,
    checkPassword: '',
    email: '',
    lastname: '',
    name: '',
    password: '',
    phoneNumber: '');

Peluqueria? peluqueria;

List<Peluquero> peluqueros = [];
List<Servicio> servicios = [];
List<DateTime> fecha = [];
List<TimeOfDay> hora = [];

final Map<String, dynamic> info = <String, dynamic>{
  'usuario': Usuario,
  'peluqueria': <Peluqueria>[].toList(growable: true),
  'peluqueros': <Peluquero>[].toList(growable: true),
  'servicios': <Servicio>[].toList(growable: true),
  'dia': <DateTime>[].toList(growable: true),
  'hora': <TimeOfDay>[].toList(growable: true),
};
