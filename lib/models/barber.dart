// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Peluquero {
    Peluquero({
        required this.descripcion,
        required this.foto,
        required this.nombre,
        this.id,
    });

    String descripcion;
    String foto;
    String nombre;
    String? id;

    factory Peluquero.fromJson(String str) => Peluquero.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Peluquero.fromMap(Map<String, dynamic> json) => Peluquero(
        descripcion: json["descripcion"],
        foto: json["foto"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "foto": foto,
        "nombre": nombre,
    };
}
