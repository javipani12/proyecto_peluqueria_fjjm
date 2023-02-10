import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.only(top: 100),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/splash.jpg',
                  fit: BoxFit.cover,
                  width: 300,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Iniciar sesion')),
                  ),
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const EditProfileScreen());
                    Navigator.push(context, route);
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Registrarme'),
                    ),
                  ),
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const RegisterScreen());
                    Navigator.push(context, route);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      height: 50,
                      width: 50,
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () => print(1),
                          child: Image.network(
                            'https://logos-world.net/wp-content/uploads/2020/09/Google-Symbol.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      height: 50,
                      width: 50,
                      color: Colors.blue.shade900,
                      child: GestureDetector(
                          onTap: () => print(1),
                          child: Image.network(
                            'https://journals.opscidia.com/public/site/facebook-logo.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
