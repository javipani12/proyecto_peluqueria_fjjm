import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  static final List<Peluqueria> listadoPeluquerias = Peluquerias.listaPeluquerias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inicio - Pedir Cita'),
      ),
      body: _ListadoPeluquerias(listadoPeluquerias: listadoPeluquerias),
    );
  }
}

class _ListadoPeluquerias extends StatelessWidget {
  const _ListadoPeluquerias({
    Key? key,
    required this.listadoPeluquerias,
  }) : super(key: key);

  final List<Peluqueria> listadoPeluquerias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listadoPeluquerias.length,
      itemBuilder: (context, index) {
        Peluqueria peluqueria = listadoPeluquerias[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 2),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    FadeInImage(
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: Duration(milliseconds: 360),
                      image: peluqueria.foto,
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,

                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),

                      child: Text(peluqueria.nombre),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(peluqueria.direccion),
                    ),
                    TextButton(
                      onPressed: () {
                        // Guarda El nombre de la peluqueria en una variable Global
                        info['peluqueria'] = peluqueria;
                        final route = MaterialPageRoute(
                          builder: (context) => BarberScreen(
                            peluqueria: peluqueria,
                          )
                        );

                        Navigator.push(context, route);
                      },
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        padding: const EdgeInsets.only(right: 10),
                        child: const Text(
                          'Pedir cita aquí',
                          style: TextStyle(decoration: TextDecoration.underline),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Novedades'),
              _ListadoNovedadesPeluqueria(peluqueria: peluqueria),
            ],
          ),
        );
      },
    );
  }
}

class _ListadoNovedadesPeluqueria extends StatelessWidget {
  const _ListadoNovedadesPeluqueria({
    Key? key,
    required this.peluqueria,
  }) : super(key: key);

  final Peluqueria peluqueria;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: peluqueria.novedades.length,
        itemBuilder: (BuildContext context, int novedadIndex) {
          final novedad = peluqueria.novedades[novedadIndex];
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: novedad.foto,
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
                  novedad.titulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
