import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class UsuarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Usuario? usuario;

  UsuarioFormProvider( this.usuario );

  updatePrivacyPolicy( bool value ) {
    if(value) {
      this.usuario?.acceptPrivacy = value;
    } else {
      return 'Debes aceptar la Política de privacidad';
    }
    
    notifyListeners();
  }

  updatePublicity( bool value ) {
    this.usuario?.acceptPublicity = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}