import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/edit_profile_screen.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class ProfileScreen extends StatelessWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
        

      /*
        actions: <Widget>[
          
          GestureDetector(
            onTap: (){
              print('object');
            },
            child: const Text(
              'Editar',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),         
          ),
        ],
        */
   
    body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage('https://www.rctb1899.es/sites/default/files/noticia/imatge//2495_1.jpg'),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(top: 10, bottom: 30, left: 5),
                child: const Text(
                  'Rafa Nadal',
                  style: TextStyle(
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
                      child: const Text(
                        'Apellidos: Perez',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'Email: juan@gmail.com',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'Teléfono: 958591093',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'Contraseña: ********',
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