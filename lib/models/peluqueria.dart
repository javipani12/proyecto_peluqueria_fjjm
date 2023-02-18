import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class Peluqueria{

  final String nombre;
  final String direccion;
  final String telefono;
  final NetworkImage foto;
  final List<Novedades> novedades;

  Peluqueria({
    required this.nombre,
    required this.direccion,
    required this.foto,
    required this.telefono,
    required this.novedades,
  });

}