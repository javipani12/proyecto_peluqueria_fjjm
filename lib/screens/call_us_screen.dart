import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class CallUsScreen extends StatelessWidget {

  const CallUsScreen({super.key, required this.peluquerias});

  final List<Peluqueria> peluquerias;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    bottomNavigationBar: buttonNavigationBar(),
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Llámanos'),
      ),
      body: ListView.builder(
        itemCount: peluquerias.length,
        itemBuilder: (context, index) {
          
          final peluqueria = peluquerias[index]; 
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(peluqueria.nombre),
                  Text(peluqueria.direccion),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Llamar')),
                    ),
                    onPressed: () async => {
                      await FlutterPhoneDirectCaller.callNumber(peluqueria.telefono),
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
     );
  }
}



callNumber() async {
  const number = '+34601389389'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
