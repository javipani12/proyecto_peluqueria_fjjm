import 'package:flutter/material.dart';
import 'models.dart';

class Servicios{

  static final List<Servicio> listaServicios = [
    Servicio(
      nombre: 'Corte de pelo', 
      precio: 10.5,
      foto: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cortar-pelo-sanear-1642094588.jpg')
    ),
    Servicio(
      nombre: 'Tinte', 
      precio: 20.1, 
      foto: NetworkImage('https://img.remediosdigitales.com/839528/woman-getting-her-hair-dyed-at-home-by-hairstylist/450_1000.jpg')
    ),

    Servicio(
      nombre: 'Peinado',
      precio: 7.5, 
      foto: NetworkImage('https://img.freepik.com/foto-gratis/peluquero-peinando-cabello-cliente_23-2148940850.jpg')
    ),
    Servicio(
      nombre: 'Recorte de barba', 
      precio: 5.5, 
      foto: NetworkImage('https://rhombusgents.com/blog/wp-content/uploads/2019/03/recortar-barba-cabecera.png')
    ),
  ];

}