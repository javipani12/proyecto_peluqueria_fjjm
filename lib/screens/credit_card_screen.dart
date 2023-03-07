import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:proyecto_peluqueria_fjjm/models/models.dart';
import 'package:proyecto_peluqueria_fjjm/services/reservas_services.dart';
import 'package:proyecto_peluqueria_fjjm/themes/app_themes.dart';
import 'package:proyecto_peluqueria_fjjm/widgets/widgets.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/services/variable.dart' as variablesGlobales;

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

  double precio = 0;

  String peluqueros() {
    String peluqueros = '';
    for (int i = 0; i < variablesGlobales.peluqueros.length; i++) {
      peluqueros += variablesGlobales.peluqueros[i].nombre + ", ";
    }
    peluqueros = peluqueros.substring(0, peluqueros.length - 2);
    ;
    return peluqueros;
  }

  double calcularPrecio(){
    double precio = 0;

    for (int i = 0; i < variablesGlobales.servicios.length; i++) {
      precio += variablesGlobales.servicios[i].precio;
    }

    return precio;
  }

  String servicios() {
    String servicios = '';
    for (int i = 0; i < variablesGlobales.servicios.length; i++) {
      servicios += '${variablesGlobales.servicios[i].nombre}, ';
    }
    servicios = servicios.substring(0, servicios.length - 2);
    return servicios;
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
    return ChangeNotifierProvider<ReservasServices>(
      create: (_) => ReservasServices(),
      child: Consumer<ReservasServices>(builder: (context, reservasServices, _) {
        return Scaffold(
          bottomNavigationBar: const ButtonNavigationBar(),
          appBar: AppBar(
            title: const Text('Tarjeta'),
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
                    obscureNumber: false,
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
                      labelText: 'Nº de tarjeta',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      floatingLabelStyle: TextStyle(color: AppThemes.primary),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ),
                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expiración',
                      hintText: 'XX/XX',
                      floatingLabelStyle: TextStyle(color: AppThemes.primary),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                      floatingLabelStyle: TextStyle(color: AppThemes.primary),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre del titular',
                      floatingLabelStyle: TextStyle(color: AppThemes.primary),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppThemes.primary),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () async {
                      if (myFormKey.currentState!.validate()) {
                        Reserva reserva = Reserva(
                          eliminado: false,
                          fechaHora: variablesGlobales.fechaHora,
                          idUsuario: variablesGlobales.usuario.id!,
                          importe: calcularPrecio(),
                          metodoPago: 'Tarjeta',
                          peluqueria: variablesGlobales.peluqueria!.nombre,
                          peluqueros: peluqueros(),
                          servicios: servicios(),
                        );
                        reservasServices.createReserva(reserva);
                        precio = 0;
                        final route = MaterialPageRoute(
                          builder: (context) => const ReservationsScreen()
                        );
                        Navigator.push(context, route);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
