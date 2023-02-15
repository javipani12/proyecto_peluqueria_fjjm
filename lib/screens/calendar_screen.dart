import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreen();
}

class _CalendarScreen extends State<CalendarScreen> {
  bool pulsado = false;

  ElevatedButton button() {
    if (pulsado) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        child: const Text('Cancelar'),
        onPressed: () {
          setState(() {
            pulsado = !pulsado;
          });
        },
      );
    } else {
      return ElevatedButton(
        child: const Text('Reservar'),
        onPressed: () {
          calendar['dia'] = today;
          /*
          final route = MaterialPageRoute(builder: (context) => PagoScreen());
          Navigator.push(context, route);
          setState(() {
            pulsado = !pulsado;
          });
          */
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
    String precio = calendar.containsKey('precio').toString();
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas'), actions: const [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://as01.epimg.net/meristation/imagenes/2013/09/17/noticia/1379397600_125748_1532601596_portada_normal.jpg'),
        ),
      ]),
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
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      textAlign: TextAlign.start,
                      '9:00 / 10:30',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      calendar.containsKey('tipo').toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.access_time_rounded),
                    Text(
                      'duracion: 1h 30 min',
                    ),
                  ],
                ),
                _BookingCalendar(),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: button()),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingCalendar extends StatefulWidget {
  const _BookingCalendar({
    super.key,
  });

  @override
  State<_BookingCalendar> createState() => _BookingCalendarState();
}

Stream<dynamic>? getBookingStreamMock(
    {required DateTime end, required DateTime start}) {
  return Stream.value([]);
}

final now = DateTime.now();

Future<dynamic> uploadBookingMock({required BookingService newBooking}) async {
  await Future.delayed(const Duration(seconds: 1));
  converted.add(DateTimeRange(
      start: newBooking.bookingStart, end: newBooking.bookingEnd));
}

List<DateTimeRange> converted = [];

List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
  ///here you can parse the streamresult and convert to [List<DateTimeRange>]
  ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
  ///disabledDays will properly work with real data
  DateTime first = now;
  DateTime tomorrow = now.add(Duration(days: 1));

  converted.add(
      DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));

  //book whole day example
  converted.add(DateTimeRange(
      start: now, end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day)));
  return converted;
}

List<DateTimeRange> generatePauseSlots() {
  return [
    DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 12, 0),
        end: DateTime(now.year, now.month, now.day, 13, 0))
  ];
}

class _BookingCalendarState extends State<_BookingCalendar> {
  @override
  Widget build(BuildContext context) {
    return BookingCalendar(
      locale: 'es_ES',
      bookingService: BookingService(
          bookingStart: now,
          bookingEnd: DateTime(2023, 2, 16),
          serviceName: "lola",
          serviceDuration: 20),
      convertStreamResultToDateTimeRanges: convertStreamResultMock,
      getBookingStream: getBookingStreamMock,
      uploadBooking: uploadBookingMock,
      pauseSlots: generatePauseSlots(),
      // startingDayOfWeek: StartingDayOfWeek.monday,
      wholeDayIsBookedWidget:
          const Text('Sorry, for this day everything is booked'),
      //disabledDates: [DateTime(2023, 1, 20)],
      //disabledDays: [6, 7],
    );
  }
}
