import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class BarberScreen extends StatefulWidget {

  final Peluqueria peluqueria;

  const BarberScreen({Key? key, required this.peluqueria}) : super(key: key);

  @override
  State<BarberScreen> createState() => _BarberScreenState();
}

class _BarberScreenState extends State<BarberScreen> {

  bool _sliderEnable = false;
  static List<Peluquero> listaPeluqueros = Peluqueros.listaPeluqueros;
  static List<Peluquero> peluquerosSeleccionados = [];
  static List<Color> coloresPeluquerosSeleccionados = List.generate(listaPeluqueros.length, (index) => Colors.black);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          SwitchListTile( // Puede ser true o false, no tiene valores nulos
            activeColor: AppThemes.primary,
            title: const Text('Seleccionar todos/as'),
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {
                if(_sliderEnable){

                  peluquerosSeleccionados.clear();
                  for(int i = 0; i < listaPeluqueros.length; i++){
                    peluquerosSeleccionados.add(listaPeluqueros[i]);
                  }
                  for(int i = 0; i < coloresPeluquerosSeleccionados.length; i++){
                    coloresPeluquerosSeleccionados[i] = Colors.green;
                  }

                } else {

                  peluquerosSeleccionados.clear();
                  for(int i = 0; i < coloresPeluquerosSeleccionados.length; i++){
                    coloresPeluquerosSeleccionados[i] = Colors.black;
                  }

                }
                print(peluquerosSeleccionados);
              });
            },
          ),
          const SizedBox(height: 40,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listaPeluqueros.length,
              itemBuilder: (BuildContext context, int index) {
                final peluquero = listaPeluqueros[index];                
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
                              for(int i = 0; i < listaPeluqueros.length; i++){
                                if(listaPeluqueros[i] == peluquero){
                                  coloresPeluquerosSeleccionados[i] = Colors.green;
                                }
                              }

                            } else {

                              peluquerosSeleccionados.remove(peluquero);
                              for(int i = 0; i < listaPeluqueros.length; i++){
                                if(listaPeluqueros[i] == peluquero){
                                  coloresPeluquerosSeleccionados[i] = Colors.black;
                                }
                              }

                            }
                          });
                        },
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: peluquero.foto,
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        peluquero.nombre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: coloresPeluquerosSeleccionados[index]),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        peluquero.descripcion,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: coloresPeluquerosSeleccionados[index]),
                      )
                    ]
                  ),
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
              if(peluquerosSeleccionados.length == 0) {
                alertaPeluqueros(context);
              } else {
                //Screen de servicios a la que le pasaremos la peluqueria y la lista de peluqueros
                final route = MaterialPageRoute(
                        builder: (context) => ServicesScreen(peluquerosSeleccionados: peluquerosSeleccionados, peluqueria: widget.peluqueria,));
                    Navigator.push(context, route);
                }
            },
          ),
          SizedBox(height: 90,)
        ],
      )
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