import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

import 'package:proyecto_peluqueria_fjjm/providers/calendar_from_provider.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/calendario_services.dart';
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
            child: ChangeNotifierProvider(
          create: (_) => CalendarFormProvider(),
          child: _center(),
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

  int servicios = 2;
  List<TimeOfDay> horas = [];

  List<Calendario> listCalendar = [];

  TextButton hora(TimeOfDay hora) {
    DateFormat formatoData = DateFormat.yMd();
    //print(formatoData.format(_selectedDay));
    String timeOFDayString = '${hora.hour}:${hora.minute}';

    if (listCalendar[0].tiempo == timeOFDayString &&
        formatoData.format(listCalendar[0].fecha) ==
            formatoData.format(_selectedDay)) {
      return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.grey,
        ),
        onPressed: null,
        child: Text('${hora.hour}:${hora.minute}'),
      );
    } else {
      if (horas.contains(hora)) {
        return TextButton(
          style: TextButton.styleFrom(
            primary: Colors.grey,
          ),
          child: Text(
            '${hora.hour}:${hora.minute}',
          ),
          onPressed: () {
            setState(() {
              servicios += 1;

              horas.remove(hora);
            });
          },
        );
      } else {
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
  }

  @override
  Widget build(BuildContext context) {
    final calendar = Provider.of<CalendariosServices>(context);
    if (calendar.isLoading)
      return CircularProgressIndicator(
        color: Colors.indigo,
      );
    listCalendar = calendar.calendarios;
    /*DateFormat formatoData = DateFormat.yMd();
    String dataFormatada = formatoData.format(calendar.calendarios[0].fecha);
    print(dataFormatada);
*/
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
              onPressed: () {
                if (horas.isEmpty) {
                  alertaCalendario(context);
                } else {
                  //Guarda en un a varable  global las horas
                  variablesGlobales.info['hora'] = horas;
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
