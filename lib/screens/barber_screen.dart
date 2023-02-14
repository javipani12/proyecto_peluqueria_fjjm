import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class BarberScreen extends StatefulWidget {
   
  const BarberScreen({Key? key}) : super(key: key);

  @override
  State<BarberScreen> createState() => _BarberScreenState();
}

class _BarberScreenState extends State<BarberScreen> {

  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
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
      body: Column(
        children: [
          SwitchListTile( // Puede ser true o false, no tiene valores nulos
            activeColor: AppThemes.primary,
            title: const Text('Seleccionar todos/as'),
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {
                
              });
            },
          ),
        ],
      )
    );
  }
}