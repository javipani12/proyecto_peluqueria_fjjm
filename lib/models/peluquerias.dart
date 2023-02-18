import 'package:flutter/material.dart';
import 'models.dart';

class Peluquerias{

  static final List<Peluqueria> listaPeluquerias = [

    Peluqueria(
      nombre: 'Paco\'s Barber', 
      direccion: 'Camino de Ronda nº 6', 
      telefono: '+34666666666',
      foto: NetworkImage('https://www.salonsilvianovo.es/images/silvia-novo-peluqueria-unisex-estetica-fene.jpg'),
      novedades: ListadosNovedades.listaNovedades1,
    ),
    Peluqueria(
      nombre: 'Turume', 
      direccion: 'Avenida de Barcelona nº 26', 
      telefono: '+34722544688',
      foto: NetworkImage('https://media.quincemil.com/imagenes/2022/05/28012746/Peluqueria_M%C3%A1gica-8-640x360.jpg'),
      novedades: ListadosNovedades.listaNovedades2,
    ),
  ];

}