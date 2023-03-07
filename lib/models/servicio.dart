import 'dart:convert';

class Servicio {
  Servicio({
    required this.duracion,
    required this.foto,
    required this.nombre,
    required this.precio,
    this.id,
  });

  int duracion;
  String foto;
  String nombre;
  double precio;
  String? id;

  factory Servicio.fromJson(String str) => Servicio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Servicio.fromMap(Map<String, dynamic> json) => Servicio(
    duracion: json["duracion"],
    foto: json["foto"],
    nombre: json["nombre"],
    precio: json["precio"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "duracion": duracion,
    "foto": foto,
    "nombre": nombre,
    "precio": precio,
  };
}
