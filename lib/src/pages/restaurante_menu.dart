import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/src/widgets/banner_menu.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/titulo_card.dart';
import 'package:spoonacular/src/widgets/titulo_primario.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

class RestauranteMenuPage extends StatelessWidget {
  //const RestauranteMenuPage({Key key}) : super(key: key);
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final String arguments = ModalRoute.of(context).settings.arguments;
    print(arguments);
    final spoonacularBloc = Provider.spoonacularBloc(context);
    final spoonacularProvider = new SpoonacularProvider();
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
                      prefs.idioma == 0 ? "Restaurant" : "Restaurante"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TituloPrimario(arguments),
              SizedBox(
                height: 5,
              ),
              TituloCard(
                  prefs.idioma == 0 ? "Main Meals" : "Platos Principales",
                  primaryBlack),
              _bannerMenu(spoonacularProvider, arguments),
              TituloCard(
                  prefs.idioma == 0 ? "Other Meals" : "Otros", primaryBlack),
              _bannerMenuSecundario(spoonacularProvider, arguments, 10),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _bannerMenu(SpoonacularBloc bloc, String arguments) {
  //   bloc.cargarMenuItems(arguments, false);
  //   return StreamBuilder(
  //     stream: bloc.menuItemsStream,
  //     initialData: null,
  //     builder: (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
  //       if (snapshot.data == null) {
  //         return CircularProgressIndicator();
  //       } else {
  //         List<MenuItem> items = snapshot.data;
  //         return BannerMenu(menuItems: items);
  //       }
  //     },
  //   );
  // }
  Widget _bannerMenu(SpoonacularProvider provider, String arguments) {
    return FutureBuilder(
      future: provider.getMenuItems(arguments, false),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<MenuItem> items = snapshot.data;
          if (items.length < 1) {
            return _chipNoDisponible(prefs.idioma == 0
                ? 'Meal Items not available, try again later.'
                : 'Platos no disponible, inténtelo más tarde.');
          } else {
            return BannerMenu(menuItems: items);
          }
        }
      },
    );
  }

  Widget _chipNoDisponible(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: primaryWhite, fontSize: 12),
      ),
      backgroundColor: primaryBrown,
    );
  }

  // Widget _bannerMenuSecundario(
  //     SpoonacularBloc bloc, String arguments, int offset) {
  //   bloc.cargarMenuItemsSecu(arguments, false, offset);
  //   return StreamBuilder(
  //     stream: bloc.menuItemsStreamSec,
  //     initialData: null,
  //     builder: (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
  //       if (snapshot.data == null) {
  //         return CircularProgressIndicator();
  //       } else {
  //         List<MenuItem> items = snapshot.data;
  //         return BannerMenu(menuItems: items);
  //       }
  //     },
  //   );
  // }
  Widget _bannerMenuSecundario(
      SpoonacularProvider provider, String arguments, int offset) {
    return FutureBuilder(
      future: provider.getMenuItemsSecu(arguments, false, offset),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<MenuItem> items = snapshot.data;
          if (items.length < 1) {
            return _chipNoDisponible(prefs.idioma == 0
                ? 'Meal Items not available, try again later.'
                : 'Platos no disponibles, inténtelo más tarde.');
          } else {
            return BannerMenu(menuItems: items);
          }
        }
      },
    );
  }
}
