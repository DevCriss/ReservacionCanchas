import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservacion_canchas/src/pages/agendar_page.dart';
import 'package:reservacion_canchas/src/pages/home_page.dart';
import 'package:reservacion_canchas/src/pages/informacion_page.dart';
import 'package:reservacion_canchas/src/providers/agendamientos_provider.dart';
import 'package:reservacion_canchas/src/providers/formulario_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AgendamientosProvider()),
        ChangeNotifierProvider(create: (context) => FormularioProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'agendar': (context) => AgendarPage(),
          'info': (context) => InformacionPage(),
        },
      ),
    );
  }
}
