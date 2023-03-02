import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

Usuario usuario = Usuario(
    acceptPrivacy: true,
    acceptPublicity: true,
    checkPassword: '',
    efectivo: false,
    email: '',
    lastname: '',
    name: '',
    password: '',
    phoneNumber: '');

Peluqueria? peluqueria;

List<Peluquero> peluqueros = [];
List<Servicio> servicios = [];
String fecha = '';
List<String> horas = [];
String fechaHora = '';
String metodoPago = '';