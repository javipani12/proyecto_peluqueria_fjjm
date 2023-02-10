import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValues = {
      'name': '',
      'lastname': '',
      'email': '',
      'phoneNumber': '',
      'password': '',
      'checkPassword': '',
      'acceptPublicity': '',
      'acceptPrivacy': ''
    };

    return Scaffold(
      body: Form(
        key: myFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const FlutterLogo(size: 100),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Nombre',
                suffixIcon: Icons.group,
                formProperty: 'name',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Apellidos',
                suffixIcon: Icons.group,
                formProperty: 'lastname',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Email',
                suffixIcon: Icons.email_outlined,
                formProperty: 'email',
                email: TextInputType.emailAddress,
                formValues: formValues,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Telefono',
                suffixIcon: Icons.phone_android_outlined,
                formProperty: 'phoneNumber',
                email: TextInputType.emailAddress,
                formValues: formValues,
                keyboardType: TextInputType.phone,
                size: 9,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Contraseña',
                suffixIcon: Icons.password_outlined,
                obscureText: true,
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldRegister(
                hintText: 'Contraseña',
                suffixIcon: Icons.password_outlined,
                obscureText: true,
                formProperty: 'checkPassword',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCheckboxFormFieldRegister(
                titulo: 'Aceptar política de privacidad',
                formProperty: 'acceptPrivacy',
                formValues: formValues,
              ),
              CustomCheckboxFormFieldRegister(
                titulo: 'Aceptar envío de promociones',
                formProperty: 'acceptPublicity',
                formValues: formValues,
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
                    print(formValues);
                  }
                },
                child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Registrarse'))),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}