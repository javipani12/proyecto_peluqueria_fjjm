import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({
    super.key,
  });

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

int currentIndex = 0;

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
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
