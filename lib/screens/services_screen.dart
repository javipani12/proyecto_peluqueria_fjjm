import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class ServicesScreen extends StatefulWidget {
   
  const ServicesScreen({Key? key, }) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  
  bool sliderEnable = false;
  final List<Servicio> serviciosSeleccionados = [];

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<ServiciosServices>(
      create: (_) => ServiciosServices(),
      child: Consumer<ServiciosServices>(
        builder: (context, serviciosServices, _) {
      
          final serviciosServices = Provider.of<ServiciosServices>(context);
          
          return Scaffold(
            bottomNavigationBar: buttonNavigationBar(),
            appBar: AppBar(
              title: const Text('Selección servicios'),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20,),
                SwitchListTile(
                  activeColor: AppThemes.primary,
                  title: const Text('Seleccionar todos'),
                  value: sliderEnable, 
                  onChanged: (value) {
                    sliderEnable = value;
                    setState(() {
                      if(sliderEnable){
                        serviciosSeleccionados.clear();
                        for(int i = 0; i < serviciosServices.servicios.length; i++){
                          serviciosSeleccionados.add(serviciosServices.servicios[i]);
                        }
                      } else {
                        serviciosSeleccionados.clear();
                      }
                    });
                  },
                ),
                const SizedBox(height: 40,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: serviciosServices.servicios.length,
                    itemBuilder: (BuildContext context, int index) {
                      final servicio = serviciosServices.servicios[index];                
                      return Container(
                        width: 130,
                        height: 190,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(!serviciosSeleccionados.contains(servicio)) {
                                    serviciosSeleccionados.add(servicio);

                                  } else {
                                    serviciosSeleccionados.remove(servicio);                             
                                 }
                                });
                              },
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(20),
                                child: FadeInImage(
                                  placeholder: AssetImage('assets/jar-loading.gif'),
                                  image: NetworkImage(servicio.foto),
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
                            ),
                            Text(
                              servicio.precio.toString() + '€',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            )
                          ]),
                        );
                      },
                    ),
                  ),
                  Text('Seleccionados:'),
                  SizedBox(height: 5,),
                  Text(
                    mostrarServiciosSeleccionados(serviciosSeleccionados)
                  ),
                  SizedBox(height: 20,),
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
                        //no borrar si no no funciona
                        //Esto guarda los peluqueros en la variable global info
                        variablesGlobales.info['servicios'] = serviciosSeleccionados;
                        variablesGlobales.servicios = serviciosSeleccionados;
                        for(int i = 0; i<serviciosSeleccionados.length; i++){
                          print(serviciosSeleccionados[i].nombre);
                        }
                        final route = MaterialPageRoute(
                          builder: (context) => CalendarScreen()
                        );
                        Navigator.push(context, route);
                      }
                    },
                  ),
                SizedBox(height: 90,)
              ],
            )
          );
        }
      ),
    );
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
    })
  );
}

String mostrarServiciosSeleccionados(List<Servicio> serviciosSeleccionados){
  String servicios = '';
  if(serviciosSeleccionados.length > 0) {
    for(int i = 0; i < serviciosSeleccionados.length; i++){
      servicios += serviciosSeleccionados[i].nombre + ', ';
    }

    servicios = servicios.substring(0, servicios.length - 2);
  }
  
  return servicios;
}