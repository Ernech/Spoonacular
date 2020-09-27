import 'package:flutter/material.dart';
import 'package:spoonacular/src/pages/home_page.dart';
import 'package:spoonacular/src/pages/inicio_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage()
        //'inicio': (BuildContext context) => InicioPage()
      },
    );
  }
}
