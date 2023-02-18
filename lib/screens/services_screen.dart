import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class ServicesScreen extends StatefulWidget {
  final Peluqueria peluqueria;
  final List<Peluquero> peluquerosSeleccionados;

  const ServicesScreen(
      {Key? key,
      required this.peluqueria,
      required this.peluquerosSeleccionados})
      : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool _sliderEnable = false;
  static List<Servicio> listaServicios = Servicios.listaServicios;
  static List<Servicio> serviciosSeleccionados = [];
  static List<Color> coloresServiciosSeleccionados =
      List.generate(listaServicios.length, (index) => Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buttonNavigationBar(),
        appBar: AppBar(
          title: const Text('Servicios'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              // Puede ser true o false, no tiene valores nulos
              activeColor: AppThemes.primary,
              title: const Text('Seleccionar todos'),
              value: _sliderEnable,
              onChanged: (value) {
                _sliderEnable = value;
                setState(() {
                  if (_sliderEnable) {
                    serviciosSeleccionados.clear();
                    for (int i = 0; i < listaServicios.length; i++) {
                      serviciosSeleccionados.add(listaServicios[i]);
                    }
                    for (int i = 0;
                        i < coloresServiciosSeleccionados.length;
                        i++) {
                      coloresServiciosSeleccionados[i] = Colors.green;
                    }
                  } else {
                    serviciosSeleccionados.clear();
                    for (int i = 0;
                        i < coloresServiciosSeleccionados.length;
                        i++) {
                      coloresServiciosSeleccionados[i] = Colors.black;
                    }
                  }
                  print(serviciosSeleccionados);
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listaServicios.length,
                itemBuilder: (BuildContext context, int index) {
                  final servicio = listaServicios[index];
                  return Container(
                    width: 130,
                    height: 190,
                    margin: const EdgeInsets.all(10),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!serviciosSeleccionados.contains(servicio)) {
                              serviciosSeleccionados.add(servicio);
                              for (int i = 0; i < listaServicios.length; i++) {
                                if (listaServicios[i] == servicio) {
                                  coloresServiciosSeleccionados[i] =
                                      Colors.green;
                                }
                              }
                            } else {
                              serviciosSeleccionados.remove(servicio);
                              for (int i = 0; i < listaServicios.length; i++) {
                                if (listaServicios[i] == servicio) {
                                  coloresServiciosSeleccionados[i] =
                                      Colors.black;
                                }
                              }
                            }
                          });
                        },
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/jar-loading.gif'),
                            image: servicio.foto,
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        servicio.nombre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: coloresServiciosSeleccionados[index]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        servicio.precio.toString(),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: coloresServiciosSeleccionados[index]),
                      )
                    ]),
                  );
                },
              ),
            ),
            ElevatedButton(
              child: const SizedBox(
                width: 200,
                child: Center(
                  child: Text('Continuar'),
                ),
              ),
              onPressed: () {
                if (serviciosSeleccionados.length == 0) {
                  alertaServicios(context);
                } else {
                  //Guarda en un a varable  gllobal los servicios
                  info['servicios'] = serviciosSeleccionados;
                  final route = MaterialPageRoute(
                      builder: (context) => const CalendarScreen());
                  Navigator.push(context, route);
                }
              },
            ),
            SizedBox(
              height: 90,
            )
          ],
        ));
  }
}

void alertaServicios(BuildContext context) {
  showDialog(
      barrierDismissible: false, // Nos permite pulsar fuera de la alerta
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('¡Atención!'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Debes seleccionar al menos un servicio'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        );
      }));
}
