import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final Map<String, dynamic> calendar = <String, dynamic>{
  'tipo': 'pista de padel',
  'dia': DateTime.now(),
  'precio': '20',
  'hora': TimeOfDay.now(),
};
final Map<String, String> pago = {
  'nombre': 'Usuario',
  'apellidos': 'Apellidos',
  'caducidad': '12/26',
  'cvv': '123',
};
