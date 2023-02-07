import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final String? helperText;
  final IconData? suffixIcon;

  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;


  const CustomTextFormField({
    super.key, 
    this.hintText, 
    this.helperText, 
    this.suffixIcon,
    required this.formProperty, 
    required this.formValues, 
    this.obscureText =false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onChanged: (value) => formValues[formProperty] = value,
      obscureText: obscureText,
      validator: (value) {
        if(formValues['email'] == value){
          if( !formValues['email']!.contains("@")){
            return 'El email no es válido';
          }
        }
        
        if(formValues['password'] == value) {
          if( formValues['password']!.length == 0){
            return 'La contraseña no es válida';
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