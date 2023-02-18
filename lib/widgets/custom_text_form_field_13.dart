import 'package:flutter/material.dart';

class CustomTextFormField_13 extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscuereText;
  final String formProperty;
  final Map<String, String> formValues;
  final int? size;

  const CustomTextFormField_13({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.keyboardType,
    this.obscuereText = false,
    required this.formProperty,
    required this.formValues,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic password = formValues['password'];
    return TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscuereText,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (size != null) {
          if (formValues['caducidad'] == value) {
            if (value?.lastIndexOf('/') != 2) {
              return 'Fata una / despues del mes';
            }
            /*
            if (DateV) {
              if(value?.substring(0,0) == '1' && (int.parse('${value?.substring(1,1)}') >-1 && int.parse('${value?.substring(1,1)}') <3 
            && int.parse('${value?.substring(1,1)}') >-1 && int.parse('${value?.substring(1,1)}')<2))
              return 'mees invalido';
            }
            */
          }
          if (value!.length != size!.toInt()) {
            return 'Tamaño $size caracteres';
          }
        } else {
          if (hintText == 'Confirmar Password') {
            if (formValues['password'] != formValues['confirmar']) {
              return 'Contraseña distinta';
            }
          } else {
            if (value!.length < 1) {
              return 'No puede estar vacio';
            }
          }
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        //helperText: formProperty,
        suffixIcon: Icon(suffixIcon),
      ),
      maxLength: size,
    );
  }
}
