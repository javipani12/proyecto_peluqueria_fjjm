import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peluqueria_fjjm/providers/usuario_form_provider.dart';
import 'package:proyecto_peluqueria_fjjm/routes/app_routes.dart';
import 'package:proyecto_peluqueria_fjjm/screens/screens.dart';
import 'package:proyecto_peluqueria_fjjm/services/services.dart';
import 'package:proyecto_peluqueria_fjjm/themes/themes.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(AppState()));
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsuariosServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalendariosServices(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peluquería',
      home: const HomeScreen(),
      theme: AppThemes.lightTheme,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
