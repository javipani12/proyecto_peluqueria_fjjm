import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
   
  const ResetPasswordScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email': '',
    };

    return Scaffold(
      body: Form(
        key: myFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _CampoRestablecerContrasenna(formValues: formValues, myFormKey: myFormKey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}

class _CampoRestablecerContrasenna extends StatelessWidget {
  const _CampoRestablecerContrasenna({
    Key? key,
    required this.formValues,
    required this.myFormKey,
  }) : super(key: key);

  final Map<String, String> formValues;
  final GlobalKey<FormState> myFormKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(1500),
          child: Image.asset(
            'assets/splash.jpg',
            fit: BoxFit.cover,
            width: 150,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text('Introduce el email asociado a tu cuenta'),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          hintText: 'Email',
          suffixIcon: Icons.email_outlined,
          formProperty: 'email',
          formValues: formValues,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            if (!myFormKey.currentState!.validate()) {
              print('Formulario no válido');
              return;
            } else {
              final route = MaterialPageRoute(
                builder: (context) => const LoginScreen()
              );
              Navigator.push(context, route);
            }
          },
          child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Restablecer contraseña'))),
        ),
      ],
    );
  }
}