import 'package:proyecto_peluqueria_fjjm/routes/menu_options.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final MenuOption = <MenuOptions>[
    /* Hay que poner solo esos campos 
    MenuOptions(name: 'Pedir cita', screen: const PedirCitaScreen()),
*/
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in MenuOption) {
      appRoutes.addAll({option.name: (BuildContext contenxt) => option.screen});
    }
    return appRoutes;
  }
}
