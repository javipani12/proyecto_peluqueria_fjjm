import 'package:flutter/material.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';

class CalendarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Calendario? calendario;

  /*
  updatePrivacyPolicy( bool value ) {
    if(value) {
      this.calendario?. = value;
    } else {
      return 'Debes aceptar la Política de privacidad';
    }
    
    notifyListeners();
  }

  updatePublicity( bool value ) {
    this.calendario?.fecha = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
  */
}
