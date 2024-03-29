import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/services/reservas_services.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReservasServices>(
        create: (_) => ReservasServices(),
        child:
            Consumer<ReservasServices>(builder: (context, reservasServices, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Mis Reservas'),
            ),
            bottomNavigationBar: const ButtonNavigationBar(),
            body: Column(
              children: [
                reserva(context, reservasServices),
              ],
            ),
          );
        }));
  }

  SingleChildScrollView reserva(
      BuildContext context, ReservasServices reservasServices) {
    int contador = 0;

    void actualizarPantalla() {
      setState(() {
        // Actualiza el estado del widget padre
      });
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 590,
        child: ListView.builder(
            itemCount: reservasServices.reservas.length,
            itemBuilder: (BuildContext context, int index) {
              final reserva = reservasServices.reservas[index];
              return Container(
                  child: reserva.idUsuario == variablesGlobales.usuario.id! &&
                          !reserva.eliminado
                      ? Column(
                          children: [
                            Text(
                              '${contador++}',
                              style: const TextStyle(color: Colors.transparent),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text(
                                      'Peluquería',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    trailing: Text(reserva.peluqueria,
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text('Peluqueros',
                                        style:
                                            TextStyle(color: Colors.black87)),
                                    trailing: Text(reserva.peluqueros,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text('Servicios',
                                        style:
                                            TextStyle(color: Colors.black87)),
                                    trailing: Text(reserva.servicios,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text('Fecha y hora',
                                        style:
                                            TextStyle(color: Colors.black87)),
                                    trailing: Text(reserva.fechaHora,
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text('Método de pago',
                                        style:
                                            TextStyle(color: Colors.black87)),
                                    trailing: Text(reserva.metodoPago,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: const Text('Importe total:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    trailing: Text(
                                      "${reserva.importe}€",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    trailing: CancelButton(
                                      onPressed: () {
                                        displayDialog(
                                            context,
                                            reserva,
                                            reservasServices,
                                            actualizarPantalla);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : contador == 0 &&
                              index == reservasServices.reservas.length - 1
                          ? const Image(
                              image: AssetImage("assets/no-results.png"))
                          : null);
            }),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        child: const Text(
          "Cancelar Reserva",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

void displayDialog(BuildContext context, Reserva reserva,
    ReservasServices reservasServices, Function actualizarVentana) {
  UsuariosServices usuariosServices = UsuariosServices();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cancelación de reserva"),
          content: Text(
              "¿Estás seguro de que quieres cancelar tu reserva del día ${reserva.fechaHora.split(" ")[0]} a las ${reserva.fechaHora.split(" ")[1]} en el local ${reserva.peluqueria}?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar")),
            TextButton(
                onPressed: () async {
                  reserva.eliminado = true;
                  usuariosServices.usuarios.forEach((usuario) {
                    if (usuario.id == reserva.idUsuario) {
                      usuario.saldo += reserva.importe;
                      usuariosServices.updateUsuario(usuario);
                    }
                  });
                  await reservasServices.updateReserva(reserva);
                  Navigator.pop(context);
                  actualizarVentana();
                },
                child: const Text("Confirmar")),
          ],
        );
      });
}
