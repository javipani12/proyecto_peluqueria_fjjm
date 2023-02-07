import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/routes/routes.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email': '',
      'password': ''
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
                CustomTextFormField(
                  hintText: 'Ejemplo@ejemplo.com',
                  suffixIcon: Icons.group,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
                CustomTextFormField(
                  hintText: 'Contraseña',
                  suffixIcon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'password',
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
                    child: Center(child: Text('Iniciar Sesión'))
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