import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart'
    as variablesGlobales;

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavigationBar(),
      appBar: AppBar(
        title: const Text('Selección fecha')

      ),
      body: ChangeNotifierProvider<CalendariosServices>(
        create: (_) => CalendariosServices(),
        child: const _center(),
      ),
    );
  }
}

class _center extends StatefulWidget {
  const _center({
    super.key,
  });

  @override
  State<_center> createState() => _centerState();
}

class _centerState extends State<_center> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  List<Calendario> listCalendar = [];

  // para recoge el el numero de botones que seleccionar

  int limite = 0;
  List<TimeOfDay> horas = [];

  List<DateTime> listDateTime = [];

  final DateFormat formatoData = DateFormat.yMd();
// Esto recorre el array del tiempo y devuelbe
  TextButton hora(TimeOfDay hora) {
    // if (limite !=0) {
    for (final DateTime dateTime in listDateTime) {
      TimeOfDay horaFromDateTime = TimeOfDay.fromDateTime(dateTime);
      if ('${horaFromDateTime.hour}:${horaFromDateTime.minute}' ==
              '${hora.hour}:${hora.minute}' &&
          formatoData.format(dateTime) == formatoData.format(today)) {
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          onPressed: null,
          child: Text(hora.toString().split("(")[1].split(")")[0]),
        );
      }

      if (!horas.contains(hora)) {
        return TextButton(
          child: Text(hora.toString().split("(")[1].split(")")[0]),
          onPressed: () {
            setState(() {
              limite -= 1;
              horas.add(hora);
            });
          },
        );
      }
    }
    //}

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey,
      ),
      child: Text(hora.toString().split("(")[1].split(")")[0]),
      onPressed: () {
        setState(() {
          limite += 1;
          horas.remove(hora);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final calendar = Provider.of<CalendariosServices>(context);
    if (calendar.isLoading) {

      return const Center(child: CircularProgressIndicator.adaptive());

    }

    String horasASeleccionar() {
      int tiempo = 0;
      String horas = '';

      for (var i = 0; i < variablesGlobales.servicios.length; i++) {
        tiempo += variablesGlobales.servicios[i].duracion;
      }

      switch (tiempo) {
        case 30:
          horas = "30 minutos";
          limite = 1;
          break;
        case 60:
          horas = "1 hora contigua";
          limite = 2;
          break;
        case 90:
          horas = "1 hora y 30 minutos contiguos";
          limite = 3;
          break;
        case 120:
          horas = "2 horas contiguas";
          limite = 4;
          break;
        case 150:
          horas = "2 horas y 30 minutos contiguos";
          limite = 5;
          break;
        case 180:
          horas = "3 horas contiguas";
          limite = 6;
          break;
        case 210:
          horas = "3 horas y 30 minutos contiguos";
          limite = 7;
          break;

        case 240:
          horas = "4 horas contiguas";
          limite = 8;
          break;
      }
      return horas;
    }

    print(variablesGlobales.usuario.email);

    listCalendar = calendar.calendarios;
    for (var i = 0; i < listCalendar.length; i++) {
      listDateTime = List.of(listCalendar[i].datetime);
    }

    print(variablesGlobales.usuario.email);

    return ListView(
      children: [

        Container(
          color: Colors.grey[300],
          child: TableCalendar(
            locale: 'es_ES',
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: today,
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 15),
            Text(
              textAlign: TextAlign.start,
              'Seleccione: ' + horasASeleccionar(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Table(
              children: <TableRow>[
                TableRow(children: <Widget>[
                  hora(const TimeOfDay(hour: 9, minute: 00)),
                  hora(const TimeOfDay(hour: 9, minute: 30)),
                  hora(const TimeOfDay(hour: 10, minute: 00)),
                ]),
                TableRow(
                  children: <Widget>[
                    hora(const TimeOfDay(hour: 10, minute: 30)),
                    hora(const TimeOfDay(hour: 11, minute: 00)),
                    hora(const TimeOfDay(hour: 11, minute: 30)),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    hora(const TimeOfDay(hour: 12, minute: 00)),
                    hora(const TimeOfDay(hour: 12, minute: 30)),
                    hora(const TimeOfDay(hour: 13, minute: 00)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 7,),
            ElevatedButton(
              child: const SizedBox(
                width: 200,
                child: Center(
                  child: Text('Continuar'),
                ),
              ),
              onPressed: () async {
                if (horas.length != limite) {
                  alertaCalendario(context);
                } else {
                  //Guarda en un a varable  global las horas
                  variablesGlobales.fecha = today.toString();
                  List<DateTime> lista = [];
                  for (TimeOfDay hora in horas) {
                    variablesGlobales.horas.add(hora.toString());
                    lista.add(DateTime(today.year, today.month, today.day,
                        hora.hour, hora.minute));
                  }

                  await calendar.saveOrCreateCalendario(Calendario(
                      datetime: lista, email: variablesGlobales.usuario.email));
                  horas.forEach((element) {
                    print(element);
                  });
                  final route = MaterialPageRoute(
                      builder: (context) => const SummaryScreen());
                  Navigator.push(context, route);
                }
              },
            ),
            const SizedBox(height: 10,)
          ]),
        ),
      ],
    );
  }
}

void alertaCalendario(BuildContext context) {
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
            children: [
              const Text('Debes seleccionar la/s hora/s indicada/s'),
              const SizedBox(
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
