import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class CallUsScreen extends StatelessWidget {

  const CallUsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PeluqueriaServices(),
        ),
      ],
      child: _CallUsBody(),
    );
  }
}

class _CallUsBody extends StatelessWidget {
  const _CallUsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final peluqueriaServices = Provider.of<PeluqueriaServices>(context);

    return Scaffold(
    bottomNavigationBar: buttonNavigationBar(),
    appBar: AppBar(
     automaticallyImplyLeading: false,
     title: const Text('Llámanos'),
     ),
     body: ListView.builder(
       itemCount: peluqueriaServices.peluquerias.length,
       itemBuilder: (context, index) {
         
         final peluqueria = peluqueriaServices.peluquerias[index]; 
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
                     await FlutterPhoneDirectCaller.callNumber(peluqueria.telefono.toString()),
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



callNumber(String numero) async {
  final number = numero; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
