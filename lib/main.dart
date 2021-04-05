import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/mapa_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider(),)
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        //cambio de colores del tema general de la aplicacion 
        theme: ThemeData(
          primaryColor: Colors.teal,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
