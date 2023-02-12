import 'package:proyecto_peluqueria_fjjm/routes/menu_options.dart';
import 'package:proyecto_peluqueria_fjjm/screens/call_us_screen.dart';
import 'package:proyecto_peluqueria_fjjm/screens/reservations_screen.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final MenuOption = <MenuOptions>[ 
    MenuOptions(
      name: 'Pedir cita', 
      screen: const AppointmentScreen()
    ),

    MenuOptions(
      name: 'Mis reservas', 
      screen: const ReservationsScreen()
    ),

    MenuOptions(
      name: 'Llamanos', 
      screen: const CallUsScreen()
    ),

    MenuOptions(
      name: 'Perfil', 
      screen: const ProfileScreen()
    ),

  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in MenuOption) {
      appRoutes.addAll({option.name: (BuildContext contenxt) => option.screen});
    }
    return appRoutes;
  }
}
