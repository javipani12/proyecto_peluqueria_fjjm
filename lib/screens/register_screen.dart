import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/providers/usuario_form_provider.dart';
import 'package:proyecto_peluqueria_fjjm/screens/home_screen.dart';
import 'package:proyecto_peluqueria_fjjm/services/usuarios_services.dart';
import 'package:proyecto_peluqueria_fjjm/themes/app_themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuariosServices>(context);

    return ChangeNotifierProvider(
      create: (context) {
        return UsuarioFormProvider(usuarioService.usuarioSeleccionado);
      },
      child: _RegisterScreenBody(usuariosServices: usuarioService,));
  }
}

class _RegisterScreenBody extends StatelessWidget {
  const _RegisterScreenBody({
    Key? key, required this.usuariosServices,
  }) : super(key: key);

  final UsuariosServices usuariosServices;

  @override
  Widget build(BuildContext context) {

    final usuarioForm = Provider.of<UsuarioFormProvider>(context);
    final usuario = usuarioForm.usuario;

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: usuarioForm.formKey,
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
                initialValue: usuario?.name,
                onChanged: (value) {
                  usuario?.name = value;
                }, 
                decoration: InputDecoration(
                  hintText: 'Nombre'
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'La longitud no es válida';
                  }

                  if (value.length > 20) {
                    return 'La longitud no puede ser mayor a 20';
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: usuario?.lastname,
                onChanged: (value) {
                  usuario?.lastname = value;
                },
                decoration: InputDecoration(
                  hintText: 'Apellidos'
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'La longitud no es válida';
                  }

                  if (value.length > 80) {
                    return 'La longitud no puede ser mayor a 80';
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: usuario?.email,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'ejemplo@ejemplo',
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  usuario?.email = value;
                },
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
                initialValue: usuario?.phoneNumber,
                onChanged: (value) {
                  usuario?.phoneNumber = value;
                },
                decoration: InputDecoration(
                  hintText: 'Teléfono'
                ),
                validator: (value) {
                  if (value!.length != 9  ) {
                    return 'La longitud debe ser 9';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: usuario?.password,
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                ),
                onChanged: (value) {
                  usuario?.password = value;
                },
                validator: ( value ) {
                  if ( value!.isEmpty) {
                    return 'La contraseña no es válida';
                  }                              
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: usuario?.checkPassword,
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: '*****',
                  labelText: 'Repetir Contraseña',
                ),
                onChanged: (value) {
                  usuario?.checkPassword = value;
                },
                validator: ( value ) {
                  if ( value != usuario?.password ) {
                    return 'Las contraseñas no coinciden';
                  }                             
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                value: usuario!.acceptPrivacy, 
                title: Text('Aceptar política de privacidad'),
                activeColor: AppThemes.primary,
                onChanged: usuarioForm.updatePrivacyPolicy
              ),
              SwitchListTile.adaptive(
                value: usuario.acceptPublicity, 
                title: Text('Aceptar envío de promociones'),
                activeColor: AppThemes.primary,
                onChanged: usuarioForm.updatePublicity,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if(!usuarioForm.isValidForm()) return;
                  await usuariosServices.createUsuario(usuarioForm.usuario!);

                  final route = MaterialPageRoute(
                    builder: (context) => const HomeScreen()
                  );
                  Navigator.push(context, route);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: 
                      Text('Registrarse')
                  )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}