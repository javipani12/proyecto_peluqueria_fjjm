import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class buttonNavigationBar extends StatefulWidget {
  const buttonNavigationBar({
    super.key,
  });

  @override
  State<buttonNavigationBar> createState() => _buttonNavigationBarState();
}

int currentIndex = 0;

class _buttonNavigationBarState extends State<buttonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 1,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          final paginas = MaterialPageRoute(
            builder: (context) => AppRoutes.MenuOption[index].screen,
          );
          Navigator.push(context, paginas);
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), label: 'Pedir cita'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_tethering),
          label: "Mis Reservas",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Llamanos"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
    );
  }
}
