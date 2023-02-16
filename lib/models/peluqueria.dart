import 'package:flutter/material.dart';

class Peluqueria{

  final String nombre;
  final String direccion;
  final String telefono;
  final NetworkImage foto;

  Peluqueria({
    required this.nombre,
    required this.direccion,
    required this.foto,
    required this.telefono,
  });

}