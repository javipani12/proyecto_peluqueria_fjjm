import 'package:flutter/material.dart';
import 'models.dart';

class Peluqueros{

  static final List<Peluquero> listaPeluqueros = [
    Peluquero(
      nombre: 'Daniel', 
      descripcion: 'Tu peluquero de siempre', 
      foto: NetworkImage('https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/media/imagenes/reportajes/peluqueros-de-pelicula/3139792-2-esl-ES/Peluqueros-de-pelicula.jpg')
    ),
    Peluquero(
      nombre: 'Rosa', 
      descripcion: '100% de mis clientas satisfechas', 
      foto: NetworkImage('http://peluqueriabeatrizhuarte.com/wp-content/uploads/virginia-crespo.jpg')
    ),

    Peluquero(
      nombre: 'Gonzalo', 
      descripcion: 'Especialista en tintes y mechas', 
      foto: NetworkImage('https://www.eldiadelarioja.es/media/IMG/2022/CDDD201D-D78C-ADE5-4FD2DDB1C70604D0.JPG')
    ),
    Peluquero(
      nombre: 'Virginia', 
      descripcion: 'Los cortes clásicos son mi especialidad', 
      foto: NetworkImage('https://www.prolaboral.com/37334/uniforme-peluquera-garys-cinta-6358.jpg')
    ),
  ];

}