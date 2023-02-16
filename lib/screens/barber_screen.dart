import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class BarberScreen extends StatefulWidget {
   
  const BarberScreen({Key? key, required this.peluqueria}) : super(key: key);

  final Peluqueria peluqueria;

  @override
  State<BarberScreen> createState() => _BarberScreenState();
}

class _BarberScreenState extends State<BarberScreen> {

  bool _sliderEnable = false;
  static List<Peluquero> _listaPeluqueros = Peluqueros.listaPeluqueros;
  static List<Peluquero> _peluquerosSeleccionados = [];
  Color seleccionado = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          SwitchListTile( // Puede ser true o false, no tiene valores nulos
            activeColor: AppThemes.primary,
            title: const Text('Seleccionar todos/as'),
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {
                if(_sliderEnable){
                  _peluquerosSeleccionados.clear();
                  for(int i = 0; i < _listaPeluqueros.length; i++){
                    _peluquerosSeleccionados.add(_listaPeluqueros[i]);
                  }
                  seleccionado = Color.fromARGB(255, 18, 184, 3);
                } else {
                  _peluquerosSeleccionados.clear();
                  seleccionado = Colors.black;
                }
                print(_peluquerosSeleccionados);
              });
            },
          ),
          const SizedBox(height: 40,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listaPeluqueros.length,
              itemBuilder: (BuildContext context, int index) {
                final peluquero = _listaPeluqueros[index];                
                return Container(
                  width: 130,
                  height: 190,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(!_peluquerosSeleccionados.contains(peluquero)) {
                              _peluquerosSeleccionados.add(peluquero);
                              seleccionado = Color.fromARGB(255, 18, 184, 3);
                            } else {
                              _peluquerosSeleccionados.remove(peluquero);
                              seleccionado = Colors.black;
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
                        style: TextStyle(color: seleccionado),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        peluquero.descripcion,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: seleccionado),
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
              /*Screen de servicios a la que le pasaremos la peluqueria y la lista de peluqueros
              final route = MaterialPageRoute(
                  builder: (context) => const ());
              Navigator.push(context, route);
              */
            },
          ),
          SizedBox(height: 90,)
        ],
      )
    );
  }
}