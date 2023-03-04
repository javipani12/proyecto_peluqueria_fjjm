import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({
    super.key,
  });

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
      bottomNavigationBar: ButtonNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Llámanos'),
      ),
      body: ListView.builder(
        itemCount: peluqueriaServices.peluquerias.length,
        itemBuilder: (context, index) {
          final peluqueria = peluqueriaServices.peluquerias[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // Posición del sombreado
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Text(peluqueria.nombre),
                    Text(peluqueria.direccion),
                    const SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      color: AppThemes.primary,
                      child: const SizedBox(
                        width: 165,
                        child: Center(
                          child: Text(
                            'Llamar',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ),
                      ),
                      onPressed: () async => {
                        await FlutterPhoneDirectCaller.callNumber(
                            peluqueria.telefono.toString()),
                      },
                    ),
                  ],
                ),
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
