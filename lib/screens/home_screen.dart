import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/providers/usuario_form_provider.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuariosServices = Provider.of<UsuariosServices>(context);

    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1500),
                  child: Image.asset(
                    'assets/splash.jpg',
                    fit: BoxFit.cover,
                    width: 300,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: Text('Iniciar sesion'),
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const LoginScreen());
                    Navigator.push(context, route);
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Registrarse'),
                  onPressed: () {
                    usuariosServices.usuarioSeleccionado = Usuario(
                        acceptPrivacy: false,
                        acceptPublicity: false,
                        checkPassword: '',
                        email: '',
                        lastname: '',
                        name: '',
                        password: '',
                        phoneNumber: '',
                        efectivo: false,
                        saldo: 0);
                    final route = MaterialPageRoute(
                        builder: (context) => const RegisterScreen());
                    Navigator.push(context, route);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
