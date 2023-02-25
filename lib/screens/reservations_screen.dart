import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  List<String> list = List.filled(5, '', growable: true);

  void displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Cancelación de reserva"),
            content: const Text(
                "¿Estás seguro de que quieres cancelar tu reserva del día X a las XX:XX en el local X?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Confirmar")),
            ],
          );
        });
  }

  List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen.toList(growable: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mis Reservas'),
        actions: const [
          
        ],
      ),
      bottomNavigationBar: buttonNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10),
          animationDuration: const Duration(milliseconds: 200),
          dividerColor: Colors.green,
          elevation: 1,
          children: [
            _Reserva(context),
          ],
          expansionCallback: (i, isOpen) =>
              setState(() => _isOpen[i] = !isOpen),
        ),
      ),
    );
  }

  ExpansionPanel _Reserva(BuildContext context) {
    return ExpansionPanel(
        canTapOnHeader: true,
        isExpanded: _isOpen[0],
        headerBuilder: (context, isOpen) {
          return const ListTile(
            title: Text('Reserva 1',
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
        },
        body: Column(
          children: [
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading: Text(
                'Peluquería',
                style: TextStyle(color: Colors.black54),
              ),
              trailing: Text("Paco's Barber",
                  style: TextStyle(color: Colors.black54)),
              onTap: () {
                setState(() {});
              },
            ),
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading:
                  Text('Peluqueros', style: TextStyle(color: Colors.black54)),
              trailing: Text("Rosa", style: TextStyle(color: Colors.black54)),
              onTap: () {
                setState(() {});
              },
            ),
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading:
                  Text('Fecha y hora', style: TextStyle(color: Colors.black54)),
              trailing: Text("XX/XX/XXXX XX:XX",
                  style: TextStyle(color: Colors.black54)),
              onTap: () {
                setState(() {});
              },
            ),
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading: Text('Importe total:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(
                '23€',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {});
              },
            ),
            ListTile(
              visualDensity: VisualDensity(vertical: -3),
              trailing: GestureDetector(
                child: Text("Cancelar Reserva",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                onTap: () {
                  displayDialog(context);
                },
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ));
  }
}
