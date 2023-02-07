import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black45,
        child: ListView(
          padding: EdgeInsets.only(top: 100),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://game-icons.net/icons/ffffff/000000/1x1/lorc/lightning-shield.png',
                  fit: BoxFit.cover,
                  width: 300,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const SizedBox(
                    width: 100,
                    child: Center(child: Text('Iniciar sesion')),
                  ),
                  onPressed: () {
                    /*Descomentar cuando este el archivo de login
                    final route = MaterialPageRoute(
                        builder: (context) => const LoginScreen());
                    Navigator.push(context, route);
                    */
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const SizedBox(
                    width: 100,
                    child: Center(
                      child: Text('Registrarme'),
                    ),
                  ),
                  onPressed: () {
                    /* Descomentar cuando este el archivo de registro  
                  final route = MaterialPageRoute(
                        builder: (context) => const RegisterScreen());
                    Navigator.push(context, route);
                    */
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
