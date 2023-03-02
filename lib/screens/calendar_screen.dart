import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
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
        bottomNavigationBar: buttonNavigationBar(),
        appBar: AppBar(
          title: const Text('Selección fecha'),
          actions: [],
        ),
        body: Center(
            child: ChangeNotifierProvider<CalendariosServices>(
          create: (_) => CalendariosServices(),
          builder: (context, _) => _center(),
        )));
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
  DateTime _selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      _selectedDay = day;
    });
  }

  List<Calendario> listCalendar = [];
  int servicios = 2;
  List<TimeOfDay> horas = [];

  List<DateTime> listDateTime = [];

  final DateFormat formatoData = DateFormat.yMd();

  TextButton hora(TimeOfDay hora) {
    for (final DateTime dateTime in listDateTime) {
      TimeOfDay horaFromDateTime = TimeOfDay.fromDateTime(dateTime);
      /* funciona 
       if (listCalendar[0].tiempo == '${hora.hour}:${hora.minute}' &&
          formatoData.format(listCalendar[0].fecha) ==
              formatoData.format(_selectedDay))
              */
      if ('${horaFromDateTime.hour}:${horaFromDateTime.minute}' ==
              '${hora.hour}:${hora.minute}' &&
          formatoData.format(dateTime) == formatoData.format(_selectedDay)) {
        return TextButton(
          style: TextButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: null,
          child: Text('${hora.hour}:${hora.minute}'),
        );
      }

      if (!horas.contains(hora)) {
        return TextButton(
          child: Text('${hora.hour}:${hora.minute}'),
          onPressed: () {
            setState(() {
              servicios -= 1;
              horas.add(hora);
            });
          },
        );
      }
    }

    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.grey,
      ),
      child: Text('${hora.hour}:${hora.minute}'),
      onPressed: () {
        setState(() {
          servicios += 1;
          horas.remove(hora);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final calendar = Provider.of<CalendariosServices>(context);
    if (calendar.isLoading)
      return CircularProgressIndicator(
        color: Colors.indigo,
      );
    print(variablesGlobales.usuario.email);
    List<DateTime> datetime = [];

    listCalendar = calendar.calendarios;
    for (var i = 0; i < listCalendar.length; i++) {
      listDateTime = List.of(listCalendar[i].datetime);
    }

    print(variablesGlobales.usuario.email);
    DateFormat formatoData = DateFormat.yMd();

    return ListView(
      children: [
        Container(
          color: Colors.grey[300],
          child: Column(children: [
            TableCalendar(
              locale: 'es_ES',
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              //startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: CalendarFormat.week,
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: today,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _onDaySelected,
            ),
          ]),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.start,
              'Seleccione: 2 horas contiguas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
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
            /*BookingCalendar(),*/
            ElevatedButton(
              child: const SizedBox(
                width: 200,
                child: Center(
                  child: Text('Continuar'),
                ),
              ),
              onPressed: () async {
                if (horas.isEmpty) {
                  alertaCalendario(context);
                } else {
                  //Guarda en un a varable  global las horas
                  variablesGlobales.fecha = _selectedDay.toString();

                  for (TimeOfDay hora in horas) {
                    variablesGlobales.horas.add(hora.toString());
                  }

                  variablesGlobales.info['hora'] = horas;
                  await calendar.saveOrCreateCalendario(
                      Calendario(datetime: listDateTime, email: variablesGlobales.usuario.email));
                  horas.forEach((element) {
                    print(element);
                  });
                  final route = MaterialPageRoute(
                      builder: (context) => const SummaryScreen());
                  Navigator.push(context, route);
                }
              },
            ),
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
            children: const [
              Text('Debes seleccionar las horas indicadas'),
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
