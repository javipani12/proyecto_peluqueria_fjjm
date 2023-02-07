import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldRegister extends StatelessWidget{

  final String? hintText;
  final String? helperText;
  final IconData? suffixIcon;

  final bool obscureText;
  final TextInputType? email;

  final String formProperty;
  final Map<String, dynamic> formValues;


  const CustomTextFormFieldRegister({
    super.key, 
    this.hintText, 
    this.helperText, 
    this.suffixIcon,
    required this.formProperty, 
    required this.formValues, 
    this.obscureText = false, 
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onChanged: (value) => formValues[formProperty] = value,
      obscureText: obscureText,
      keyboardType: email,
      validator: (value) {
        if( formValues['name'] == value ) {

          if( formValues['name'].length == 0 ) {
            return 'La longitud del nombre no es válida';
          }

          if ( formValues['name'].length > 20 ) {
            return 'La longitud del nombre no puede ser mayor a 20';
          }

        } else if( formValues['lastname'] == value ) {

          if( formValues['lastname'].length == 0 ) {
            return 'La longitud de los apellidos no es válida';
          }

          if ( formValues['lastname'].length > 80 ) {
            return 'La longitud de los apellidos no puede ser mayor a 80';
          }

        } else if(formValues['email'] == value){

          if( !formValues['email']!.contains("@")){
            return 'El email no es válido';
          }
          
        } else if(formValues['phoneNumber'] == value){

          if( formValues['phoneNumber'].length != 9){
            return 'La longitud del número debe ser de nueve dígitos';
          }

        } else if(formValues['password'] == value){

          if( formValues['password'].length < 8){
            return 'La longitud mínima de la contraseña debe ser de ocho dígitos';
          }

        } else if(formValues['checkPassword'] == value){

          if( formValues['checkPassword'] != formValues['password']){
            return 'Las contraseñas no coinciden';
          }

        } 
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}

class CustomCheckboxFormFieldRegister extends StatelessWidget {

  final String formProperty;
  final Map<String, dynamic> formValues;
  final String titulo;

  const CustomCheckboxFormFieldRegister ({
    required this.formProperty,
    required this.formValues, 
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTileFormField(
      title: Text(titulo),
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        
        if(formValues['maleGender'] == true && formValues['femaleGender'] == true) {
          return 'Solamente puedes seleccionar un género';
        }

        if(formValues['maleGender'] == false && formValues['femaleGender'] == false) {
          return 'Debes seleccionar un género';
        }

        if(formValues['acceptPrivacy'] == false) {
          return 'Debes aceptar la política de privacidad';
        }

      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      contentPadding: const EdgeInsets.all(1),
    );
  }

}