import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/services/reservas_services.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;


class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  List<String> list = List.filled(5, '', growable: true);
  List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen.toList(growable: true);

    return ChangeNotifierProvider<ReservasServices>(
      create: (_) => ReservasServices(),
      child: Consumer<ReservasServices>(
        builder: (context, reservasServices, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Mis Reservas'),
            ),
            bottomNavigationBar: ButtonNavigationBar(),
            body: Column(
              children: [
                _Reserva(context, reservasServices),
              ],
            ),
          );
        }
      )
    );
  }

  SingleChildScrollView _Reserva(BuildContext context, ReservasServices reservasServices) {
    
    int contador = 0;
    
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 590,
        child: ListView.builder(
          itemCount: reservasServices.reservas.length,
          itemBuilder: (BuildContext context, int index) {
            final reserva = reservasServices.reservas[index];
            return Container(
              child: reserva.idUsuario == variablesGlobales.usuario.id! && !reserva.eliminado
              ? Column(
                children: [
                  Text(
                    '${contador++}',
                    style: const TextStyle(
                      color: Colors.transparent
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: const Text(
                            'Peluquería',
                            style: TextStyle(
                              color: Colors.black54
                            ),
                          ),
                          trailing: Text(
                            reserva.peluqueria,
                            style: const TextStyle(
                              color: Colors.black54
                            )
                          ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading:
                            const Text(
                              'Peluqueros', 
                              style: TextStyle(
                                color: Colors.black54
                              )
                            ),
                          trailing: Text(
                            reserva.peluqueros, 
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black54
                              )
                            ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading:
                            const Text(
                              'Servicios', 
                              style: TextStyle(
                                color: Colors.black54
                              )
                            ),
                          trailing: Text(
                            reserva.servicios, 
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black54
                              )
                            ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading:
                              const Text(
                                'Fecha y hora', 
                                style: TextStyle(
                                  color: Colors.black54
                                )
                              ),
                          trailing: Text(
                            reserva.fechaHora,
                            style: const TextStyle(
                              color: Colors.black54
                            )
                          ),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading:
                              const Text(
                                'Método de pago', 
                                style: TextStyle(
                                  color: Colors.black54
                                )
                              ),
                          trailing: Text(
                            reserva.metodoPago,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black54
                            )
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: const Text(
                            'Importe total:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                              )
                            ),
                          trailing: Text(
                            "${reserva.importe}€",
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -3),
                          trailing: GestureDetector(
                            child: const Text(
                              "Cancelar Reserva",
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: Colors.red
                              )
                            ),
                            onTap: () {
                              displayDialog(context, reserva, reservasServices);
                            },
                          ),
                          onTap: () {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : Text('')
            );
          }
        ),
      ),
    );
  }
}

void displayDialog(BuildContext context, Reserva reserva, ReservasServices reservasServices) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Cancelación de reserva"),
        content: Text(
            "¿Estás seguro de que quieres cancelar tu reserva del día ${variablesGlobales.fechaHora.split(" ")[0]} a las ${variablesGlobales.fechaHora.split(" ")[1]} en el local ${variablesGlobales.peluqueria?.nombre}?"),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () async {
                reserva.eliminado = true;
                await reservasServices.updateReserva(reserva);
                Navigator.pop(context);
              }, 
              child: const Text("Confirmar")),
        ],
      );
    }
  );
}