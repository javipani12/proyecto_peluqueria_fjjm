import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreen();
}

class _CalendarScreen extends State<CalendarScreen> {
  bool pulsado = false;
  List<bool> list = List.filled(9, false, growable: true);
  int servicios = 2;
  static List<TimeOfDay> horas = [];

  TextButton hora(TimeOfDay hora, int posicion) {
    if (list[posicion]) {
      return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.grey,
        ),
        child: Text(
          '${hora.hour}:${hora.minute}',
        ),
        onPressed: () {
          setState(() {
            list[posicion] = false;
            servicios += 1;

            horas.add(hora);
          });
        },
      );
    } else {
      return TextButton(
        child: Text('${hora.hour}:${hora.minute}'),
        onPressed: () {
          list[posicion] = true;

          setState(() {
            servicios -= 1;
            horas.remove(hora);
          });
        },
      );
    }
  }

  DateTime _selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Selección fecha'),
        actions: [
        ],
      ),
      body: Center(
        child: ListView(
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
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
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
                        hora(const TimeOfDay(hour: 9, minute: 00), 0),
                        hora(const TimeOfDay(hour: 9, minute: 30), 1),
                        hora(const TimeOfDay(hour: 10, minute: 00), 2),
                      ]),
                      TableRow(
                        children: <Widget>[
                          hora(const TimeOfDay(hour: 10, minute: 30), 3),
                          hora(const TimeOfDay(hour: 11, minute: 00), 4),
                          hora(const TimeOfDay(hour: 11, minute: 30), 5),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          hora(const TimeOfDay(hour: 12, minute: 00), 6),
                          hora(const TimeOfDay(hour: 12, minute: 30), 7),
                          hora(const TimeOfDay(hour: 13, minute: 00), 8),
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
                      if (horas.length == 0) {
                        alertaCalendario(context);
                      } else {
                        //Guarda en un a varable  global las horas
                        info['hora'] = horas;
                        final route = MaterialPageRoute(
                            builder: (context) => const SummaryScreen());
                        Navigator.push(context, route);
                      }
                    },
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
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
