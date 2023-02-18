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
          padding: const EdgeInsets.only(top: 100),
          children: [
            _ImagenYBotones(),
          ],
        ),
      ),
    );
  }
}

class _ImagenYBotones extends StatelessWidget {
  const _ImagenYBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 20),
        ElevatedButton(
          child: const SizedBox(
            width: 200,
            child: Center(child: Text('Iniciar sesion')),
          ),
          onPressed: () {
            final route = MaterialPageRoute(
                builder: (context) => const LoginScreen());
            Navigator.push(context, route);
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: const SizedBox(
            width: 200,
            child: Center(
              child: Text('Registrarse'),
            ),
          ),
          onPressed: () {
            final route = MaterialPageRoute(
                builder: (context) => const RegisterScreen());
            Navigator.push(context, route);
          },
        ),
        const _LogueoGF(),
      ],
    );
  }
}

class _LogueoGF extends StatelessWidget {
  const _LogueoGF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
          ),
          child: GestureDetector(
            onTap: () => print(0),
            child: Image.network(
              'https://logos-world.net/wp-content/uploads/2020/09/Google-Symbol.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () => print(1),
            child: Image.network(
              'https://journals.opscidia.com/public/site/facebook-logo.png',
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
