import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class ListadosNovedades{

  static final List<Novedades> listaNovedades1 = [

    Novedades(
      titulo: 'Nuevo corte de pelo disponible', 
      foto: NetworkImage('https://www.benditofutbol.com/files/article_main/uploads/2014/06/23/53a87aada9391.jpg'),
    ),

    Novedades(
      titulo: 'Nuevos productos', 
      foto: NetworkImage('https://bellacosmetics.es/wp-content/uploads/2021/12/productos-de-acabado-para-el-cabello.jpg'),
    ),
  ];

  static final List<Novedades> listaNovedades2 = [

    Novedades(
      titulo: 'Cierre por descanso', 
      foto: NetworkImage('https://images.robertharding.com/zoom/RF/MI/HORIZONTAL/1174-8185.jpg'),
    ),

    Novedades(
      titulo: 'Nueva peluquera', 
      foto: NetworkImage('https://ichef.bbci.co.uk/news/640/cpsprodpb/2237/production/_97295780_db9d0cba-a65f-4ddc-a281-eeb6c9b037be.jpg'),
    ),

  ];

}