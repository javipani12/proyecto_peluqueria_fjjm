import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class SignUpScreen extends StatelessWidget {
   
  const SignUpScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': 'defaultNombre',
      'apellidos': 'defaultApellidos',
      'sexoMasculino' : '1',
      'sexoFemenino' : '0',
      'email': 'defaultEmail',
      'telefono' : 'defaultTelefono',
      'contrasenna': 'defaultContrasenna',
      'comprobarContrasenna': 'defaultContrasenna',
      'aceptarPromociones' : '1',
      'aceptarPrivacidad' : '1'

    };

    return Scaffold(
      body: Form(
        key: myFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const FlutterLogo(size: 100),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Nombre',
                  suffixIcon: Icons.group,
                  formProperty: 'nombre',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Apellidos',
                  suffixIcon: Icons.group,
                  formProperty: 'apellidos',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomCheckboxFormFieldRegister(
                  titulo: 'Masculino',
                  formProperty: 'sexo', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Email',
                  suffixIcon: Icons.email_outlined,
                  formProperty: 'email',
                  email: TextInputType.emailAddress,
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Telefono',
                  suffixIcon: Icons.phone_android_outlined,
                  formProperty: 'telefono',
                  email: TextInputType.emailAddress,
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Contraseña',
                  suffixIcon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'contrasenna',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Contraseña',
                  suffixIcon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'comprobarContrasenna',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Example',
                  obscureText: true,
                  formProperty: 'aceptarPromociones',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Example',
                  obscureText: true,
                  formProperty: 'aceptarPrivacidad',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if( !myFormKey.currentState!.validate()) {
                      print('Formulario no válido');
                      return;
                    } else {
                      print(formValues);
                    }
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Registrarse'))
                  ),
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