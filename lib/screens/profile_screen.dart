import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/edit_profile_screen.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/models/usuario.dart';
import '../services/usuarios_services.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class ProfileScreen extends StatelessWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuariosServices = Provider.of<UsuariosServices>(context);

    return Scaffold(
    bottomNavigationBar: buttonNavigationBar(),
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Perfil'),
      actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (context) => const EditProfileScreen());
                Navigator.push(context, route);
            },
          ),
        ],
      ),
       
    body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/usuario-de-medios-sociales-vectorial-icono-perfil-avatar-predeterminado-retrato-176256935.jpg'),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(top: 10, bottom: 30, left: 5),
                child: Text(
                  variablesGlobales.usuario!.name,
                  style: const TextStyle(
                          fontSize: 20.0,
                        ),),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Apellidos: ' + variablesGlobales.usuario!.lastname,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Email: ' +variablesGlobales.usuario!.email,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child:  Text(
                        'Teléfono: ' + variablesGlobales.usuario!.phoneNumber,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}