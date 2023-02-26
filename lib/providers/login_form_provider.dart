import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/usuario.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  UsuariosServices usuariosServices = UsuariosServices() ;

  Usuario? usuario;

  String? email = '';
  String? password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  
  bool isValidForm() {

    bool validacion = false;

    for(int i = 0; i < usuariosServices.usuarios.length; i++) {
      if(usuariosServices.usuarios[i].email == email && 
          usuariosServices.usuarios[i].password == password) 
      {
        validacion = formKey.currentState?.validate() ?? false;
        usuario = usuariosServices.usuarios[i];
        variablesGlobales.usuario = usuario;
      }
    }

    return validacion;
  }
}