// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Peluqueria {
    Peluqueria({
        required this.direccion,
        required this.foto,
        required this.nombre,
        required this.telefono,
        this.id,
    });

    String direccion;
    String foto;
    String nombre;
    int telefono;
    String? id;

    factory Peluqueria.fromJson(String str) => Peluqueria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Peluqueria.fromMap(Map<String, dynamic> json) => Peluqueria(
        direccion: json["direccion"],
        foto: json["foto"],
        nombre: json["nombre"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "direccion": direccion,
        "foto": foto,
        "nombre": nombre,
        "telefono": telefono,

    };
}
