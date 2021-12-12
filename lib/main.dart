import 'package:flutter/material.dart';
import 'package:google_maps/providers/scan_list_provider.dart';
import 'package:google_maps/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_maps/pages/home_page.dart';
import 'package:google_maps/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        //Colores Principales
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
