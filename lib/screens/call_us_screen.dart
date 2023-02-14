import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:proyecto_peluqueria_fjjm/screens/edit_profile_screen.dart';

import '../widgets/widgets.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({super.key});

  final phone = '+34601389389';

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    bottomNavigationBar: buttonNavigationBar(),
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Llámanos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text('PELUQUERIA 1'),
              const Text('C. Primavera, 26, 18008 Granada'),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Llámanos')),
                ),
                onPressed: () async => {
                  await FlutterPhoneDirectCaller.callNumber(phone),
                },
              ),
              const SizedBox(height: 50),
              const Text('PELUQUERIA 2'),
              const Text('C. Primavera, 26, 18008 Granada'),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Llámanos')),
                ),
                onPressed: () async => {
                  await FlutterPhoneDirectCaller.callNumber(phone),
                },
              ),const SizedBox(height: 50),
              const Text('PELUQUERIA 3'),
              const Text('C. Primavera, 26, 18008 Granada'),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Llámanos')),
                ),
                onPressed: () async => {
                  await FlutterPhoneDirectCaller.callNumber(phone),
                },
              ),
            ],
          ),
        ),
      ),
     );
  }
}



callNumber() async {
  const number = '+34601389389'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
