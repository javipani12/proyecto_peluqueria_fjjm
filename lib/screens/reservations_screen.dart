import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

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

  void displayDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: ( context ) {
        return AlertDialog(
          title: const Text("Cancelación de reserva"),
          content: const Text("¿Estás seguro de que quieres cancelar tu reserva del día X a las XX:XX en el local X?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancelar")
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Confirmar")
            ),
          ],
        );
      }
    );
  }

  List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen.toList(growable: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter App'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                maxRadius: 20,
                backgroundImage: NetworkImage('https://img.europapress.es/fotoweb/fotonoticia_20220720184850_420.jpg'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buttonNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10),
          animationDuration: const Duration(milliseconds: 200),
          dividerColor: Colors.green,
          elevation: 1,
          children: [
            _Reserva(context),
          ],
          expansionCallback: (i, isOpen) =>
              setState(() => _isOpen[i] = !isOpen),
        ),
      ),
    );
  }

  ExpansionPanel _Reserva(BuildContext context) {
    return ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: _isOpen[0],
            headerBuilder: (context, isOpen) {
              return const ListTile(
                title: Text('Reserva 1'),
              );
            },
            body: ListTile(
              title: Text('TextoA'),
              
              trailing: GestureDetector(
                child: Text("Cancelar"),
                onTap: () {
                  displayDialog(context);
                },
              ),
              onTap: () {
                setState(() {});
              },
            ),
          );
  }
}
