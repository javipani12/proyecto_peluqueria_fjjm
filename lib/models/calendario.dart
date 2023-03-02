// To parse this JSON data, do
//
//     final calendario = calendarioFromMap(jsonString);

import 'dart:convert';

class Calendario {
  Calendario({
    required this.datetime,
    required this.email,
    required this.fecha,
    required this.tiempo,
    this.id,
  });

  List<DateTime> datetime;
  String email;
  DateTime fecha;
  String tiempo;
  String? id;
  factory Calendario.fromJson(String str) =>
      Calendario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Calendario.fromMap(Map<String, dynamic> json) => Calendario(
        datetime:
            List<DateTime>.from(json["datetime"].map((x) => DateTime.parse(x))),
        email: json["email"],
        fecha: DateTime.parse(json["fecha"]),
        tiempo: json["tiempo"],
      );

  Map<String, dynamic> toMap() => {
        "datetime":
            List<dynamic>.from(datetime.map((x) => x.toIso8601String())),
        "email": email,
        "fecha": fecha.toIso8601String(),
        "tiempo": tiempo,
      };
}
