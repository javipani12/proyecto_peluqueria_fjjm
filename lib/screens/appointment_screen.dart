import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/barber_screen.dart';
import 'package:proyecto_peluqueria_fjjm/screens/pago_screen.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter App'),
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
      body: GridView.count(crossAxisCount: 1, children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 2),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                const FadeInImage(
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  fadeInDuration: Duration(milliseconds: 360),
                  image: NetworkImage(
                      'https://www.salonsilvianovo.es/images/silvia-novo-peluqueria-unisex-estetica-fene.jpg'),
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  child: Text('Peluquería'),
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Descripción/Dirección peluquería'),
                ),
                TextButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const PagoScreen());
                    Navigator.push(context, route);
                  },
                  child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      padding: const EdgeInsets.only(right: 10),
                      child: const Text(
                        'Pedir cita aquí',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
