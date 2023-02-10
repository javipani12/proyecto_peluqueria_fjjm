import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class MisReservasScreen extends StatelessWidget {
  const MisReservasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      body: Center(
        child: Text('MisReservasScreen'),
      ),
    );
  }
}
