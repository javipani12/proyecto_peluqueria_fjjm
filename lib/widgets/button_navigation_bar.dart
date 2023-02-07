import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class buttonNavigationBar extends StatelessWidget {
  const buttonNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      onTap: (index) {
        final paginas = MaterialPageRoute(
          builder: (context) => AppRoutes.MenuOption[index].screen,
        );
        Navigator.push(context, paginas);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), label: 'Pedir cita'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_tethering),
          label: "Mis Reservas",
        ),
        // BottomNavigationBarItem(icon: Icon(Icons.phone), label: "llamanos"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
    );
  }
}
