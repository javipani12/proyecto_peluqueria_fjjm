import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final myFormKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  _onValidate() {
    if (myFormKey.currentState!.validate()) {
      final route = MaterialPageRoute(
        builder: (context) => const ReservationsScreen()
      );
      Navigator.push(context, route);
      print('valido!');

    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonNavigationBar(),
      appBar: AppBar(
        title: const Text('Tarjeta'),
        actions: const [
          
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CreditCardWidget(
                cardHolderName: cardHolderName,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                expiryDate: expiryDate,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (CreditCardBrand) {},
                isHolderNameVisible: true,
              ),
              CreditCardForm(
                formKey: myFormKey, // Required
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                onCreditCardModelChange: onCreditCardModelChange,
                themeColor: Colors.red,

                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardNumberValidator: (String? cardNumber) {
                  if (cardNumber == null || cardNumber.length < 16) {
                    return 'Número de tarjeta no valido';
                  }
                },
                expiryDateValidator: (String? expiryDate) {
                  if (expiryDate == null ||
                      !RegExp('^([0-9]{2})/([0-9]{2})\$')
                          .hasMatch(expiryDate)) {
                    return 'Fecha no valida';
                  }
                  return null;
                },
                cvvValidator: (String? cvv) {
                  if (cvv == null || cvv.length != 3) {
                    return 'CVV no valido';
                  }
                  return null;
                },
                cardHolderValidator: (String? cardHolderName) {
                  if (cardHolderName == null || cardHolderName.length < 2) {
                    return 'Nombre no valido';
                  }
                  return null;
                },

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
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _onValidate,
                child: const Text(
                  'Validar',
                  style: TextStyle(
                    fontFamily: 'halter',
                    fontSize: 14,
                    package: 'flutter_credit_card',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
