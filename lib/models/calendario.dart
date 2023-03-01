// To parse this JSON data, do
//
//     final calendario = calendarioFromMap(jsonString);

import 'dart:convert';

class Calendario {
  Calendario({
    required this.email,
    required this.fecha,
    required this.tiempo,
    this.id,
  });

  String email;
  DateTime fecha;
  String tiempo;
  String? id;

  factory Calendario.fromJson(String str) =>
      Calendario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Calendario.fromMap(Map<String, dynamic> json) => Calendario(
        email: json["email"],
        fecha: DateTime.parse(json["fecha"]),
        tiempo: json["tiempo"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "fecha": fecha.toIso8601String(),
        "tiempo": tiempo,
      };
}
