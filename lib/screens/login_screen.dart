import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/providers/login_form_provider.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/themes/app_themes.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: ( _ ) => LoginFormProvider(),
              child: _LoginForm()
            )
          ]
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
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
          height: 30,
        ),
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'ejemplo@ejemplo',
            labelText: 'Email',
          ),
          onChanged: (value) => loginForm.email = value,
          validator: (value) {
            String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp  = new RegExp(pattern);
            
            return regExp.hasMatch(value ?? '')
              ? null
              : 'El email no es válido';
          },
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: '*****',
            labelText: 'Contraseña',
          ),
          onChanged: ( value ) => loginForm.password = value,
          validator: ( value ) {
            if ( value!.isEmpty ) {
              return 'La contraseña no es válida';  
            } else if (value.length < 4) {
              return 'La longitud mínima es de 4 caracteres';
            }                        
          },
        ),
        const SizedBox(
          height: 30,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: AppThemes.primary,
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
            child: Text(
              loginForm.isLoading 
                ? 'Espere'
                : 'Iniciar Sesión',
              style: TextStyle( color: Colors.white ),
            )
          ),
          onPressed: loginForm.isLoading ? null : () async {
            
            FocusScope.of(context).unfocus();
            
            if( !loginForm.isValidForm() ) {
              alertaCoincidencia(context);
            } else {
              loginForm.isLoading = true;

              await Future.delayed(Duration(seconds: 2 ));
              loginForm.isLoading = false;

              final route = MaterialPageRoute(
                builder: (context) => const AppointmentScreen()
              );
              Navigator.pushReplacement(context, route);
            }
            
          }
        ),
        const SizedBox(height: 20,),
        TextButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const ResetPasswordScreen()
            );
            Navigator.push(context, route);
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.only( right: 10),
            child: const Text('¿Has olvidado la contraseña?', style: TextStyle(decoration: TextDecoration.underline),)
          ),
        ),
      ],
    )
      ),
    );
  }
}

void alertaCoincidencia(BuildContext context){
    showDialog(
      barrierDismissible: false, // Nos permite pulsar fuera de la alerta
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('¡Atención!'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('El email o la contraseña son incorrectos'),
              SizedBox(height: 20,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('OK')
            )
          ],
        );
      })
    );
  }