import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/providers/providers.dart';
import 'package:proyecto_peluqueria_fjjm/screens/home_screen.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/usuarios_services.dart';
import 'package:proyecto_peluqueria_fjjm/themes/app_themes.dart';
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
        child: _RegisterScreenBody(
          usuariosServices: usuarioService,
        ));
  }
}

class _RegisterScreenBody extends StatelessWidget {
  const _RegisterScreenBody({
    Key? key,
    required this.usuariosServices,
  }) : super(key: key);

  final UsuariosServices usuariosServices;

  @override
  Widget build(BuildContext context) {
    final usuarioForm = Provider.of<UsuarioFormProvider>(context);
    final usuario = usuarioForm.usuario;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_circle_left),
            color: Colors.blueGrey,
            onPressed: () {
              final route =
                  MaterialPageRoute(builder: (context) => const HomeScreen());
              Navigator.push(context, route);
            },
          );
        }),
        backgroundColor: Colors.white,
      ),
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
                  onChanged: (value) {
                    usuario?.name = value;
                  },
                  decoration: InputDecoration(hintText: 'Nombre'),
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
                  onChanged: (value) {
                    usuario?.lastname = value;
                  },
                  decoration: InputDecoration(hintText: 'Apellidos'),
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
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);

                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El email no es válido';
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    usuario?.phoneNumber = value;
                  },
                  decoration: InputDecoration(hintText: 'Teléfono'),
                  validator: (value) {
                    if (value!.length != 9) {
                      return 'La longitud debe ser 9';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La contraseña no es válida';
                    } else if (value.length < 4) {
                      return 'La longitud mínima es de 4 caracteres';
                    }
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
                    labelText: 'Repetir Contraseña',
                  ),
                  onChanged: (value) {
                    usuario?.checkPassword = value;
                  },
                  validator: (value) {
                    if (value != usuario?.password) {
                      return 'Las contraseñas no coinciden';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {

                      },
                      child: Text('Aceptar política de privacidad'),
                    ),
                    Switch.adaptive(
                      value: usuario!.acceptPrivacy,
                      activeColor: AppThemes.primary,
                      onChanged: usuarioForm.updatePrivacyPolicy,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text('Aceptar enviar publicidad'),
                    ),
                    Switch.adaptive(
                      value: usuario.acceptPublicity,
                      activeColor: AppThemes.primary,
                      onChanged: usuarioForm.updatePublicity,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (!usuarioForm.isValidForm()) return;
                    await usuariosServices.createUsuario(usuarioForm.usuario!);

                    final route = MaterialPageRoute(
                        builder: (context) => const HomeScreen());
                    Navigator.push(context, route);
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Registrarse'))),
                ),
              ],
            )),
      ),
    );
  }
}
