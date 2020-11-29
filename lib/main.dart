import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/pages/estilo-vida_page.dart';
import 'package:spoonacular/src/pages/home_page.dart';
import 'package:spoonacular/src/pages/ingredientes_page.dart';
import 'package:spoonacular/src/pages/login.dart';
import 'package:spoonacular/src/pages/meal_information_page.dart';
import 'package:spoonacular/src/pages/registro.dart';
import 'package:spoonacular/src/pages/restaurante_menu.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //print(formatter.format(new DateTime.fromMillisecondsSinceEpoch(myvalue*1000)));
    final prefs = PreferenciasUsuario();
    print('Idioma ${prefs.idioma}');
    if (prefs.token != null) {
      print(prefs.token);
    } else {
      print('null');
    }
    final mapp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: (prefs.token == null || prefs.token == '') ? '/' : '/home',
      routes: {
        '/': (BuildContext context) => Login(),
        '/registro': (BuildContext context) => Registro(),
        '/home': (BuildContext context) => HomePage(),
        '/ingredientes': (BuildContext context) => IngredientesPage(),
        '/restauranteMenu': (BuildContext context) => RestauranteMenuPage(),
        '/estiloVida': (BuildContext context) => EstiloVidaPage(),
        '/mealInformation': (BuildContext context) => MealInformationPage()
      },
      debugShowCheckedModeBanner: false,
    );
    return Provider(
      child: mapp,
    );
  }
}
