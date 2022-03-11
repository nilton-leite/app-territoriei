// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:territoriei/routes.dart';
import 'package:territoriei/screens/home/index.dart';

void main() {
  runApp(Territoriei());
}

// ignore: use_key_in_widget_constructors
class Territoriei extends StatefulWidget {
  @override
  TerritorieiState createState() => TerritorieiState();
}

class TerritorieiState extends State<Territoriei> {

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
     return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      // locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          backgroundColor:const Color(0xff3E434C),
          iconTheme: const IconThemeData(color: Color(0xffcc39191)),
          actionsIconTheme: const IconThemeData(color: Color(0xffcc39191)),
          centerTitle: false,
          elevation: 15,
          titleTextStyle: const TextStyle(color: Color(0xffFFC000), fontSize: 25),
          
        ),
      ),
      // ignore: unrelated_type_equality_checks
      routes: routes,
        initialRoute: Home.route,
    );
  }
}
