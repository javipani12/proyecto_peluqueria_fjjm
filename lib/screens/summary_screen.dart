import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/button_navigation_bar.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  PaymentMethod? paymentMethod;
  @override
  Widget build(BuildContext context) {
    double precio = 0;

    String peluqueros() {
      String peluqueros = '';
      for (int i = 0; i < variablesGlobales.peluqueros.length; i++) {
        peluqueros += variablesGlobales.peluqueros[i].nombre + ", ";
      }
      peluqueros = peluqueros.substring(0, peluqueros.length - 2);
      ;
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

    String fechaHora() {
      String fechaHora = '';

      fechaHora = variablesGlobales.fecha.split(" ")[0] +
          " " +
          variablesGlobales.horas[0].split("(")[1].split(")")[0];
      variablesGlobales.fechaHora = fechaHora;
      return fechaHora;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Finalizar reserva'),
          actions: const [],
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
                          trailing: Text(fechaHora(),
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
                    trailing: Radio(
                      value: PaymentMethod.creditCard,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    )),
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
                    trailing: Radio(
                      value: PaymentMethod.bizum,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value;
                        });
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
                    trailing: Radio(
                      value: PaymentMethod.cash,
                      groupValue: paymentMethod,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
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

enum PaymentMethod { bizum, creditCard, cash }

String conceptoBizum() {
  String concepto = variablesGlobales.peluqueria?.id ?? '';
  for (var i = 0; i < variablesGlobales.peluqueros.length; i++) {
    String conceptoPeluquero = variablesGlobales.peluqueros[i].id ?? '';
    concepto += conceptoPeluquero;
  }
  concepto += variablesGlobales.fechaHora.split(" ")[0];
  concepto += variablesGlobales.fechaHora.split(" ")[1];
  return concepto;
}
