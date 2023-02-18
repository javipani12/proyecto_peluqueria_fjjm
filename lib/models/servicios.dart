import 'package:flutter/material.dart';
import 'models.dart';

class ServicioS{

  static final List<Servicio> listaServicios = [
    Servicio(
      nombre: 'Daniel', 
      descripcion: 'Tu Servicio de siempre', 
      foto: NetworkImage('https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/media/imagenes/reportajes/Servicios-de-pelicula/3139792-2-esl-ES/Servicios-de-pelicula.jpg')
    ),
    Servicio(
      nombre: 'Rosa', 
      descripcion: '100% de mis clientas satisfechas', 
      foto: NetworkImage('http://peluqueriabeatrizhuarte.com/wp-content/uploads/virginia-crespo.jpg')
    ),

    Servicio(
      nombre: 'Gonzalo', 
      descripcion: 'Especialista en tintes y mechas', 
      foto: NetworkImage('https://www.eldiadelarioja.es/media/IMG/2022/CDDD201D-D78C-ADE5-4FD2DDB1C70604D0.JPG')
    ),
    Servicio(
      nombre: 'Virginia', 
      descripcion: 'Los cortes clásicos son mi especialidad', 
      foto: NetworkImage('https://www.prolaboral.com/37334/uniforme-peluquera-garys-cinta-6358.jpg')
    ),
  ];

}