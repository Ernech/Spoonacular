import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/meal_diet_model.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/src/widgets/banner_alimentos-permitidos.dart';
import 'package:spoonacular/src/widgets/banner_meal.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/titulo_card.dart';
import 'package:spoonacular/src/widgets/titulo_primario.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

class EstiloVidaPage extends StatelessWidget {
  //const RestauranteMenuPage({Key key}) : super(key: key);
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final spoonacularBloc = Provider.spoonacularBloc(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCDDE47), Colors.white],
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonAtras(),
                  TituloSecundario(
                      prefs.idioma == 0 ? "Lifestyle" : "Estilo de vida"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TituloPrimario(arguments['titulo']),
              SizedBox(
                height: 5,
              ),
              TituloCard(
                  prefs.idioma == 0
                      ? "General information"
                      : "Información General",
                  primaryGreen),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          arguments['imagen'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topCenter,
                                colors: [Colors.black87, Colors.transparent]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(arguments['titulo'],
                                style: TextStyle(
                                    fontSize: 25, color: primaryWhite)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                child: Text(
                  arguments['descripcion'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TituloCard(prefs.idioma == 0 ? "Allowed" : "Alimentos permitidos",
                  primaryGreen),
              // BannerAlimentosPermitidos(),
              (arguments['titulo'] == "Vegetariano" ||
                      arguments['titulo'] == "Vegano" ||
                      arguments['titulo'] == "Vegetarian" ||
                      arguments['titulo'] == "Vegan")
                  ? BannerAlimentosPermitidos(arguments['permitidos'])
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                      child: Text(
                        arguments['permitidos'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              TituloCard(
                  prefs.idioma == 0 ? "Not Allowed" : "Alimentos no permitidos",
                  primaryGreen),
              (arguments['titulo'] == "Vegetariano" ||
                      arguments['titulo'] == "Vegano" ||
                      arguments['titulo'] == "Vegetarian" ||
                      arguments['titulo'] == "Vegan")
                  ? BannerAlimentosPermitidos(arguments['noPermitidos'])
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                      child: Text(
                        arguments['noPermitidos'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
              TituloCard(prefs.idioma == 0 ? "Meals" : "Platos", primaryGreen),
              _bannerMenu(spoonacularBloc, arguments['diet'])
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerMenu(SpoonacularBloc bloc, String diet) {
    bloc.cargarPlanAlimentacion(diet);
    return StreamBuilder(
      stream: bloc.mealPlanStream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<Meal>> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<Meal> items = snapshot.data;
          return BannerMeal(meals: items);
        }
      },
    );
  }
}
