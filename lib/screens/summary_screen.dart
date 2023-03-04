import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/services/reservas_services.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/button_navigation_bar.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'as variablesGlobales;

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  PaymentMethod? paymentMethod;
  @override
  Widget build(BuildContext context) {

    String peluqueros() {
      String peluqueros = '';
      for (int i = 0; i < variablesGlobales.peluqueros.length; i++) {
        peluqueros += variablesGlobales.peluqueros[i].nombre + ", ";
      }
      peluqueros = peluqueros.substring(0, peluqueros.length - 2);
      ;
      return peluqueros;
    }

    double calcularPrecio(){
      double precio = 0;

      for (int i = 0; i < variablesGlobales.servicios.length; i++) {
        precio += variablesGlobales.servicios[i].precio;
      }

      return precio;
    }

    String servicios() {
      String servicios = '';
      for (int i = 0; i < variablesGlobales.servicios.length; i++) {
        servicios += variablesGlobales.servicios[i].nombre + ', ';
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

    return  ChangeNotifierProvider<ReservasServices>(
      create: (_) => ReservasServices(),
      child: Consumer<ReservasServices>(
        builder: (context, serviciosServices, _) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Finalizar reserva'),
              actions: const [],
            ),
            bottomNavigationBar: const ButtonNavigationBar(),
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
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              leading: const Text(
                                'Peluqueros',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black54
                                ),
                              ),
                              trailing: Text(peluqueros(),
                                  style: const TextStyle(color: Colors.black54)),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              leading: const Text(
                                'Fecha y hora',
                                style: TextStyle(color: Colors.black54),
                              ),
                              trailing: Text(fechaHora(),
                                  style: const TextStyle(color: Colors.black54)),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              leading: const Text(
                                'Servicios',
                                style: TextStyle(color: Colors.black54),
                              ),
                              trailing: Text(
                                servicios(),
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.black54
                                )
                              ),
                            ),
                            const Divider(
                              indent: 15,
                              endIndent: 15,
                            ),
                            ListTile(
                              title: const Text(
                                'Total',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text('${calcularPrecio()}€',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                        leading: const Icon(Icons.credit_card),
                        title: const Text(
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
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                        leading: const Icon(Icons.mobile_friendly),
                        title: const Text(
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
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text(
                        'Efectivo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Radio(
                        value: PaymentMethod.cash,
                        groupValue: paymentMethod,
                        onChanged: 
                          !variablesGlobales.usuario.efectivo 
                          ? 
                            null 
                          : 
                            (PaymentMethod? value) {
                              setState(() {
                                paymentMethod = value;
                              });
                            },
                      )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Continuar')),
                      ),
                      onPressed: () async{
                        Reserva reserva = Reserva(
                          eliminado: false,
                          fechaHora: variablesGlobales.fechaHora, 
                          idUsuario: variablesGlobales.usuario.id!, 
                          importe: calcularPrecio(), 
                          metodoPago: '', 
                          peluqueria: variablesGlobales.peluqueria!.nombre, 
                          peluqueros: peluqueros(), 
                          servicios: servicios(),
                        );
                        if (paymentMethod == PaymentMethod.bizum) {
                          reserva.metodoPago = 'Bizum - ${conceptoBizum()}';
                          await serviciosServices.createReserva(reserva);
                          final route = MaterialPageRoute(
                            builder: (context) => const ReservationsScreen());
                            Navigator.push(context, route);
                        } else if (paymentMethod == PaymentMethod.cash) {
                          reserva.metodoPago = 'Efectivo';
                          await serviciosServices.createReserva(reserva);
                          final route = MaterialPageRoute(
                            builder: (context) => const ReservationsScreen());
                            Navigator.push(context, route);
                        } else {
                          final route = MaterialPageRoute(
                            builder: (context) => const CreditCardScreen());
                            Navigator.push(context, route);
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          );
        }
      )
    );
  }
}

enum PaymentMethod { bizum, creditCard, cash }

String conceptoBizum() {
  String concepto = variablesGlobales.peluqueria?.id ?? '';
  for (var i = 0; i < variablesGlobales.peluqueros.length; i++) {
    String conceptoPeluquero = variablesGlobales.peluqueros[i].id ?? '';
    concepto += conceptoPeluquero;
  }
  concepto += variablesGlobales.fechaHora.split(" ")[0].replaceAll("-", "");
  concepto += variablesGlobales.fechaHora.split(" ")[1].replaceAll(":", "");
  return concepto;
}
