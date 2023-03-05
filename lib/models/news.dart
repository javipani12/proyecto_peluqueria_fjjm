import 'dart:convert';

class Novedad {
  Novedad({
    required this.foto,
    required this.titulo,
    this.id,
  });

  String foto;
  String titulo;
  String? id;

  factory Novedad.fromJson(String str) => Novedad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Novedad.fromMap(Map<String, dynamic> json) => Novedad(
    foto: json["foto"],
    titulo: json["titulo"],
  );

  Map<String, dynamic> toMap() => {
    "foto": foto,
    "titulo": titulo,
  };
}
