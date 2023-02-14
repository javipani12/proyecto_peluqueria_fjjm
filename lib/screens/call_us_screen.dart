import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = '+34601389389';
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () async => {
            await FlutterPhoneDirectCaller.callNumber(phone),
          },
          child: Text("Call me"),
        ),
      ),
    );
  }
}

callNumber() async {
  const number = '+34601389389'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
