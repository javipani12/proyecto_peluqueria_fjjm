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
      'maleGender' : '',
      'femaleGender' : '',
      'email': '',
      'phoneNumber' : '',
      'password': '',
      'checkPassword': '',
      'acceptPublicity' : '',
      'acceptPrivacy' : ''
    };

    return Scaffold(
      body: Form(
        key: myFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Center(
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage('https://www.rctb1899.es/sites/default/files/noticia/imatge//2495_1.jpg'),
                  ),
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Nombre',
                  suffixIcon: Icons.group,
                  formProperty: 'name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Apellidos',
                  suffixIcon: Icons.group,
                  formProperty: 'lastname',
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
                  formProperty: 'phoneNumber',
                  email: TextInputType.emailAddress,
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Contraseña',
                  suffixIcon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormFieldRegister(
                  hintText: 'Contraseña',
                  suffixIcon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'checkPassword',
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
                    child: Center(child: Text('Guardar'))
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