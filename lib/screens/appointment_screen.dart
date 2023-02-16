import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/barber_screen.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class AppointmentScreen extends StatelessWidget {
   
  const AppointmentScreen({Key? key}) : super(key: key);

  static final List<Peluqueria> listadoPeluquerias = Peluquerias.listaPeluquerias; 
  
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
                backgroundImage: NetworkImage('https://img.europapress.es/fotoweb/fotonoticia_20220720184850_420.jpg'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listadoPeluquerias.length,
        itemBuilder: (context, index) {
          Peluqueria peluqueria = listadoPeluquerias[index];

          return Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8, top: 2),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  FadeInImage(
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/jar-loading.gif'), 
                    fadeInDuration: Duration(milliseconds: 360),
                    image: peluqueria.foto,
                  ),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Text(peluqueria.nombre),
                  ),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(peluqueria.direccion),
                  ),
                  TextButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => BarberScreen(peluqueria: peluqueria,));
                    Navigator.push(context, route);
                  },
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text('Pedir cita aquí', style: TextStyle(decoration: TextDecoration.underline),)
                  ),
                ),
                ],
              ),
            ),
          );},
      ),    
    );
  }
}