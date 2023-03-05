import 'dart:convert';

class Reserva {
  Reserva({
    required this.eliminado,
    required this.fechaHora,
    required this.idUsuario,
    required this.importe,
    required this.metodoPago,
    required this.peluqueria,
    required this.peluqueros,
    required this.servicios,
    this.id,
  });

  bool eliminado;
  String fechaHora;
  String idUsuario;
  double importe;
  String metodoPago;
  String peluqueria;
  String peluqueros;
  String servicios;
  String? id;

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) => Reserva(
    eliminado: json["eliminado"],
    fechaHora: json["fechaHora"],
    idUsuario: json["idUsuario"],
    importe: json["importe"]?.toDouble(),
    metodoPago: json["metodoPago"],
    peluqueria: json["peluqueria"],
    peluqueros: json["peluqueros"],
    servicios: json["servicios"],
  );

  Map<String, dynamic> toMap() => {
    "eliminado": eliminado,
    "fechaHora": fechaHora,
    "idUsuario": idUsuario,
    "importe": importe,
    "metodoPago": metodoPago,
    "peluqueria": peluqueria,
    "peluqueros": peluqueros,
    "servicios": servicios,
  };
}
