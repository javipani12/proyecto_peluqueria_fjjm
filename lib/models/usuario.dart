import 'dart:convert';

class Usuario {
  Usuario({
    required this.acceptPrivacy,
    required this.acceptPublicity,
    required this.checkPassword,
    required this.efectivo,
    required this.email,
    required this.lastname,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.saldo,
    this.id,
  });

  bool acceptPrivacy;
  bool acceptPublicity;
  String checkPassword;
  bool efectivo;
  String email;
  String lastname;
  String name;
  String password;
  String phoneNumber;
  num saldo;
  String? id;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
      acceptPrivacy: json["acceptPrivacy"],
      acceptPublicity: json["acceptPublicity"],
      checkPassword: json["checkPassword"],
      efectivo: json["efectivo"],
      email: json["email"],
      lastname: json["lastname"],
      name: json["name"],
      password: json["password"],
      phoneNumber: json["phoneNumber"],
      saldo: json["saldo"]);

  Map<String, dynamic> toMap() => {
        "acceptPrivacy": acceptPrivacy,
        "acceptPublicity": acceptPublicity,
        "checkPassword": checkPassword,
        "efectivo": efectivo,
        "email": email,
        "lastname": lastname,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "saldo": saldo
      };

  Usuario copy() => Usuario(
      acceptPrivacy: acceptPrivacy,
      acceptPublicity: acceptPublicity,
      checkPassword: checkPassword,
      efectivo: efectivo,
      email: email,
      lastname: lastname,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
      saldo: saldo);
}
