import 'package:flutter/material.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  List<String> list = List.filled(5, '', growable: true);
  /*
  List<Map<String, dynamic>> items = [
    {'pista': reserva['pista'],
    'dia': reserva.['dia'],
    'precio':reserva['precio'] },

];
*/
  List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen.toList(growable: true);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10),
          animationDuration: const Duration(milliseconds: 200),
          dividerColor: Colors.green,
          elevation: 1,
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: _isOpen[0],
              headerBuilder: (context, isOpen) {
                return const ListTile(
                  title: Text('Reserva 1'),
                );
              },
              body: ListTile(
                title: Text('TextoA'),
                
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {});
                },
              ),
            ),
          ],
          expansionCallback: (i, isOpen) =>
              setState(() => _isOpen[i] = !isOpen),
        ),
      ),
    );
  }
}
