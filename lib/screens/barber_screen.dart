import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class BarberScreen extends StatefulWidget {

  const BarberScreen({Key? key,}) : super(key: key);

  @override
  State<BarberScreen> createState() => _BarberScreenState();
}

class _BarberScreenState extends State<BarberScreen> {
  
  bool sliderEnable = false;
  final List<Peluquero> peluquerosSeleccionados = [];

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<PeluquerosServices>(
      create: (_) => PeluquerosServices(),
      child: Consumer<PeluquerosServices>(
        builder: (context, peluquerosServices, _) {
      
          final peluquerosServices = Provider.of<PeluquerosServices>(context);
          
          return Scaffold(
            bottomNavigationBar: buttonNavigationBar(),
            appBar: AppBar(
              title: const Text('Selección peluqueros/as'),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20,),
                SwitchListTile(
                  activeColor: AppThemes.primary,
                  title: const Text('Seleccionar todos/as'),
                  value: sliderEnable, 
                  onChanged: (value) {
                    sliderEnable = value;
                    setState(() {
                      if(sliderEnable){
                        peluquerosSeleccionados.clear();
                        for(int i = 0; i < peluquerosServices.peluqueros.length; i++){
                          peluquerosSeleccionados.add(peluquerosServices.peluqueros[i]);
                        }
                      } else {
                        peluquerosSeleccionados.clear();
                      }
                    });
                  },
                ),
                const SizedBox(height: 40,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: peluquerosServices.peluqueros.length,
                    itemBuilder: (BuildContext context, int index) {
                      final peluquero = peluquerosServices.peluqueros[index];                
                      return Container(
                        width: 130,
                        height: 190,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(!peluquerosSeleccionados.contains(peluquero)) {
                                    peluquerosSeleccionados.add(peluquero);

                                  } else {
                                    peluquerosSeleccionados.remove(peluquero);                             
                                 }
                                });
                              },
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(20),
                                child: FadeInImage(
                                  placeholder: AssetImage('assets/jar-loading.gif'),
                                  image: NetworkImage(peluquero.foto),
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
                              peluquero.nombre,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              peluquero.descripcion,
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
                    mostrarPeluquerosSeleccionados(peluquerosSeleccionados)
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
                      if (peluquerosSeleccionados.length == 0) {
                        alertaPeluqueros(context);
                      } else {
                        variablesGlobales.peluqueros = peluquerosSeleccionados;
                        for(int i = 0; i<peluquerosSeleccionados.length; i++){
                          print(peluquerosSeleccionados[i].nombre);
                        }
                        final route = MaterialPageRoute(
                          builder: (context) => ServicesScreen()
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

void alertaPeluqueros(BuildContext context){
  showDialog(
    barrierDismissible: false, // Nos permite pulsar fuera de la alerta
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: const Text('¡Atención!'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Debes seleccionar al menos un peluquero/a'),
            SizedBox(height: 20,),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('OK')
          )
        ],
      );
    })
  );
}

String mostrarPeluquerosSeleccionados(List<Peluquero> peluquerosSeleccionados){
  String peluqueros = '';
  if(peluquerosSeleccionados.length > 0) {
    for(int i = 0; i < peluquerosSeleccionados.length; i++){
      peluqueros += peluquerosSeleccionados[i].nombre + ', ';
    }

    peluqueros = peluqueros.substring(0, peluqueros.length - 2);
  }
  
  return peluqueros;
}