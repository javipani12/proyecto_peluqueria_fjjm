import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/button_navigation_bar.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double precio = 0;

    String peluqueros() {
      String peluqueros = '';
      for (int i = 0; i < variablesGlobales.peluqueros.length; i++) {
        peluqueros += variablesGlobales.peluqueros[i].nombre + ", ";
      }
      peluqueros = peluqueros.substring(0, peluqueros.length - 2);;
      return peluqueros;
    }

    String servicios() {
      String servicios = '';
      for (int i = 0; i < variablesGlobales.servicios.length; i++) {
        servicios += variablesGlobales.servicios[i].nombre + ', ';
        precio += variablesGlobales.servicios[i].precio;
      }
      servicios = servicios.substring(0, servicios.length - 2);
      return servicios;
    }

    List horas() {
      List list = [];
      for (int i = 0; i < variablesGlobales.info['hora'].length; i++) {
        list.add(variablesGlobales.info['hora'][i].hour);
      }
      return list;
    }

    PaymentMethod? paymentMethod;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Finalizar reserva'),
          actions: const [

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
                      children: [
                        ListTile(
                          title: Text(
                            variablesGlobales.peluqueria!.nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Text(
                            'Peluqueros',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text(peluqueros(),
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
                            'Servicios',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text(servicios(),
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
                          trailing: Text(precio.toString() + '€',
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
                      paymentMethod = PaymentMethod.creditCard;
                    },
                  )
                ),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                ListTile(
                    leading: Icon(Icons.mobile_friendly),
                    title: Text(
                      'Bizum',
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
                  )
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Continuar')),
                  ),
                  onPressed: () {
                    final route = MaterialPageRoute(
                      builder: (context) => const CreditCardScreen());
                  Navigator.push(context, route);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

enum PaymentMethod { paypal, creditCard, cash }
