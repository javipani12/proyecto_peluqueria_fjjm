import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';

class PagoScreen extends StatelessWidget {
  const PagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey_13 = GlobalKey<FormState>();

/*
    List<String> lista = <String>[];
    lista.add(nombre);
    lista.add(day.toString());
    lista.add(precio);
*/

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    'Precio: 10'),
                const SizedBox(height: 20),
                CreditCardWidget(
                  glassmorphismConfig: Glassmorphism(
                    blurX: 10.0,
                    blurY: 10.0,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.green.withAlpha(20),
                        Colors.black.withAlpha(20),
                      ],
                      stops: const <double>[
                        0.3,
                        0,
                      ],
                    ),
                  ),
                  cardHolderName: 'LolOwwww',
                  cardNumber: '4000 1234 5678 9010',
                  //cardNumber: '5412 7512 3412 3456',
                  cvvCode: '222',
                  expiryDate: '22/22',
                  showBackView: false,

                  onCreditCardWidgetChange: (CreditCardBrand) {},
                ),
                Form(
                  key: myFormKey_13,
                  child: Column(children: [
                    CustomTextFormField_13(
                      hintText: 'Nombre',
                      suffixIcon: Icons.group_add_outlined,
                      formProperty: 'nombre',
                      formValues: pago,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField_13(
                      hintText: 'Apellido',
                      suffixIcon: Icons.group_add_outlined,
                      formProperty: 'apellido',
                      formValues: pago,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField_13(
                      hintText: 'Número de tarjeta',
                      formProperty: 'tarjeta',
                      suffixIcon: Icons.credit_card_sharp,
                      formValues: pago,
                      keyboardType: TextInputType.number,
                      size: 12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField_13(
                      hintText: 'MM/YY',
                      formProperty: 'caducidad',
                      formValues: pago,
                      size: 5,
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField_13(
                      hintText: 'CVV',
                      formProperty: 'cvv',
                      formValues: pago,
                      keyboardType: TextInputType.number,
                      size: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                          width: double.maxFinite,
                          child: Center(child: Text('Pagar'))),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!myFormKey_13.currentState!.validate()) {
                          print('Formulario no valido');
                          return;
                        }
                      },
                    ),
                  ]),
                ),
                /*  CreditCardForm(
                  formKey: myFormKey_13, // Required
                  cardNumber: "",
                  cvvCode: "",
                  expiryDate: "",
                  cardHolderName: "",
                  onCreditCardModelChange:
                      (CreditCardModel data) {}, // Required
                  themeColor: Colors.red,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardNumberValidator: (String? cardNumber) {},
                  expiryDateValidator: (String? expiryDate) {},
                  cvvValidator: (String? cvv) {},
                  cardHolderValidator: (String? cardHolderName) {},

                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                    
                  ),
                ),*/
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
