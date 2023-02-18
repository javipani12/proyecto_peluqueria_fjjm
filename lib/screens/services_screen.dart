import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class ServicesScreen extends StatefulWidget {
   
  const ServicesScreen({Key? key, }) : super(key: key);

  //final Peluqueria peluqueria;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  bool _sliderEnable = false;
  static List<Servicio> _listaServicios = _ServiciosSeleccionados;
  static List<Servicio> _ServiciosSeleccionados = [];
  static List<Color> _coloresServiciosSeleccionados = List.generate(_listaServicios.length, (index) => Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Servicios'),
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

                  _ServiciosSeleccionados.clear();
                  for(int i = 0; i < _listaServicios.length; i++){
                    _ServiciosSeleccionados.add(_listaServicios[i]);
                  }
                  for(int i = 0; i < _coloresServiciosSeleccionados.length; i++){
                    _coloresServiciosSeleccionados[i] = Colors.green;
                  }

                } else {

                  _ServiciosSeleccionados.clear();
                  for(int i = 0; i < _coloresServiciosSeleccionados.length; i++){
                    _coloresServiciosSeleccionados[i] = Colors.black;
                  }

                }
                print(_ServiciosSeleccionados);
              });
            },
          ),
          const SizedBox(height: 40,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listaServicios.length,
              itemBuilder: (BuildContext context, int index) {
                final servicio = _listaServicios[index];                
                return Container(
                  width: 130,
                  height: 190,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(!_ServiciosSeleccionados.contains(servicio)) {

                              _ServiciosSeleccionados.add(servicio);
                              for(int i = 0; i < _listaServicios.length; i++){
                                if(_listaServicios[i] == servicio){
                                  _coloresServiciosSeleccionados[i] = Colors.green;
                                }
                              }

                            } else {

                              _ServiciosSeleccionados.remove(servicio);
                              for(int i = 0; i < _listaServicios.length; i++){
                                if(_listaServicios[i] == servicio){
                                  _coloresServiciosSeleccionados[i] = Colors.black;
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
                            image: servicio.foto,
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        servicio.nombre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: _coloresServiciosSeleccionados[index]),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        servicio.descripcion,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: _coloresServiciosSeleccionados[index]),
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
              /*Screen de servicios a la que le pasaremos la peluqueria y la lista de Servicios
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