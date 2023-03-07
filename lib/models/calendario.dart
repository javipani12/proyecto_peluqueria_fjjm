// To parse this JSON data, do
//
//     final calendario = calendarioFromMap(jsonString);

import 'dart:convert';

class Calendario {
  Calendario({
    required this.datetime,
    required this.email,
    this.id,
  });

  List<DateTime> datetime;
  String email;
  String? id;
  factory Calendario.fromJson(String str) =>
      Calendario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Calendario.fromMap(Map<String, dynamic> json) => Calendario(
    datetime: List<DateTime>.from(json["datetime"].map((x) => DateTime.parse(x))),
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
  "datetime": List<dynamic>.from(datetime.map((x) => x.toIso8601String())),
  "email": email,
};
}
