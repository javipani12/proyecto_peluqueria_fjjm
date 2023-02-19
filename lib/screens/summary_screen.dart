import 'package:flutter/material.dart';

import 'package:proyecto_peluqueria_fjjm/widgets/button_navigation_bar.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PaymentMethod? paymentMethod;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Finalizar reserva'),
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
        bottomNavigationBar: buttonNavigationBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              children: [
                const Text(
                  'Resumen de tu pedido',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text(
                            "Peluquería Paco's Barber",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Text(
                            'Peluqueros',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text("Rosa",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Text(
                            'Fecha y hora',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text("XX/XX/XXXX XX:XX",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Text(
                            'Corte de pelo',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text("10,05€",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Text(
                            'Tinte',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text("20,01€",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        Divider(
                          indent: 15,
                          endIndent: 15,
                        ),
                        ListTile(
                          title: Text(
                            'Total',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text("30,06€",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text(
                      'Tarjeta Bancaria',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio<PaymentMethod>(
                      value: PaymentMethod.paypal,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        paymentMethod = PaymentMethod.paypal;
                      },
                    )),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                ListTile(
                    leading: Icon(Icons.paypal),
                    title: Text(
                      'PayPal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio<PaymentMethod>(
                      value: PaymentMethod.paypal,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        paymentMethod = PaymentMethod.paypal;
                      },
                    )),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      'Efectivo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio<PaymentMethod>(
                      value: PaymentMethod.paypal,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        paymentMethod = PaymentMethod.paypal;
                      },
                    )),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Continuar')),
                  ),
                  onPressed: () async => {
                    //Navigator.push(context, route),
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

enum PaymentMethod { paypal, creditCard, cash }
