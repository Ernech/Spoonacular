import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';
import 'package:spoonacular/src/widgets/banner_menu.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/titulo_card.dart';
import 'package:spoonacular/src/widgets/titulo_primario.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

import 'package:spoonacular/constants.dart';

class RestauranteMenuPage extends StatelessWidget {
  //const RestauranteMenuPage({Key key}) : super(key: key);
  final SpoonacularProvider spoonacularProvider = new SpoonacularProvider();
  @override
  Widget build(BuildContext context) {
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
                  TituloSecundario("Restaurante"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TituloPrimario("Leckerbrot"),
              SizedBox(
                height: 5,
              ),
              TituloCard("Platos principales"),
              _bannerMenu(),
              TituloCard("Otros"),
              _bannerMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerMenu() {
    SpoonacularProvider menuItemProvider = new SpoonacularProvider();
    return FutureBuilder(
      future: menuItemProvider.getMenuItems('pollo'),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<MenuItem> items = snapshot.data;
          return BannerMenu(menuItems: items);
        }
      },
    );
  }
}
