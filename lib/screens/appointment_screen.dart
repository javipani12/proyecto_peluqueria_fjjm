import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'screens.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PeluqueriaServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => NovedadesServices(),
        ),
      ],
      child: _PeluqueriasBody(),
    );
  }
}

class _PeluqueriasBody extends StatelessWidget {
  const _PeluqueriasBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Peluqueria peluqueria;

    return Scaffold(
      bottomNavigationBar: ButtonNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inicio'),
      ),
      body: _AppointmentBody(),
    );
  }
}

class _AppointmentBody extends StatelessWidget {
  const _AppointmentBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        'Novedades',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      _ListadoNovedades(),
      const SizedBox(
        height: 20,
      ),
      Text(
        'Peluquerías',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(child: _ListadoPeluquerias()),
    ]);
  }
}

class _ListadoPeluquerias extends StatelessWidget {
  const _ListadoPeluquerias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peluqueriaServices = Provider.of<PeluqueriaServices>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: peluqueriaServices.peluquerias.length,
      itemBuilder: (context, index) {
        Peluqueria peluqueria = peluqueriaServices.peluquerias[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 2),
          child: Card(
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
                  image: NetworkImage(peluqueria.foto),
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
                    variablesGlobales.peluqueria = peluqueria;
                    final route =
                        MaterialPageRoute(builder: (context) => BarberScreen());
                    Navigator.push(context, route);
                    variablesGlobales.peluqueria = peluqueria;
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
        );
      },
    );
  }
}

class _ListadoNovedades extends StatelessWidget {
  const _ListadoNovedades({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final novedadesServices = Provider.of<NovedadesServices>(context);

    return SizedBox(
      height: 260,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: novedadesServices.novedades.length,
        itemBuilder: (BuildContext context, int novedadIndex) {
          final novedad = novedadesServices.novedades[novedadIndex];
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(novedad.foto),
                      width: 130,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  width: double.infinity,
                  height: 30,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3), // Posición del sombreado
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 2),
                          child: Text(
                            novedad.titulo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
