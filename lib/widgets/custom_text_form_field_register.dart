import 'dart:html';

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
      onSaved: (bool? value) {
        print(value);
      },
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if( formValues['sexo'] == value ) {

        } else {
          if( formValues['aceptarPromociones'] == value ){

          } else {
            if( formValues['aceptarPrivacidad'] == value ){

            }
          }
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      contentPadding: const EdgeInsets.all(1),
    );
  }

}