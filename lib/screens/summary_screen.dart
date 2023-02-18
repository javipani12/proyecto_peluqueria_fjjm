import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> peluqueros() {
      List<String> list = [];
      for (int i = 0; i < info['peluqueros'].length; i++) {
        list.add(info['peluqueros'][i].nombre);
      }
      return list;
    }

    List servicio() {
      List list = [];
      for (int i = 0; i < info['servicios'].length; i++) {
        list.add(info['servicios'][i].nombre);
      }
      return list;
    }

    List horas() {
      List list = [];
      for (int i = 0; i < info['hora'].length; i++) {
        list.add(info['hora'][i].hour);
      }
      return list;
    }

    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Resumen'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage(
                  'https://img.europapress.es/fotoweb/fotonoticia_20220720184850_420.jpg'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        children: [
          Text("Peliqueria ${info['peluqueria'].nombre}"),
          SizedBox(height: 20),
          Text("Peluquero: ${peluqueros()}"),
          SizedBox(height: 20),
          Text("Servicio ${servicio()}"),
          SizedBox(height: 20),
          Text("Hora ${horas()}"),
          SizedBox(height: 20),
          ElevatedButton.icon(
              onPressed: () {
                final route = MaterialPageRoute(
                    builder: (context) => const CreditCardScreen());
                Navigator.push(context, route);
              },
              label: Text('Con Tarjeta'),
              icon: Icon(Icons.add_card)),
          ElevatedButton.icon(
              onPressed: null,
              label: Text('Con dinero'),
              icon: Icon(Icons.money)),
        ],
      ),
    );
  }
}
