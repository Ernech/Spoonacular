import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import '../../constants.dart';

class BannerIngredientes extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  List<Ingredient> ingredientes;
  BannerIngredientes(this.ingredientes);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    if (ingredientes == null || ingredientes.length == 0) {
      var bannerView = Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Chip(
          label: Text(
            prefs.idioma == 0
                ? 'Ingredients not available'
                : 'Ingredientes no disponibles',
            style: TextStyle(color: primaryWhite, fontSize: 12),
          ),
          backgroundColor: primaryBrown,
        ),
      );
      banners.add(bannerView);
    } else {
      for (int i = 0; i < ingredientes.length; i++) {
        var bannerView = _crearBanner(ingredientes[i].name);
        banners.add(bannerView);
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          children: banners,
        ),
      ),
    );
  }

  Widget _crearBanner(String ingrediente) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Chip(
        label: _crearTexto(prefs, ingrediente),
        backgroundColor: primaryBrown,
      ),
    );
  }

  Widget _crearTexto(PreferenciasUsuario prefs, String ingrediente) {
    switch (prefs.idioma) {
      case 0:
        return Text(
          ingrediente,
          style: TextStyle(color: primaryWhite, fontSize: 12),
        );
        break;
      case 1:
        return FutureBuilder(
          future: utils.traducirAEs(ingrediente),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(
                snapshot.data,
                style: TextStyle(color: primaryWhite, fontSize: 12),
              );
            }
          },
        );
        break;
      default:
        return Text(
          ingrediente,
          style: TextStyle(color: primaryWhite, fontSize: 12),
        );
    }
  }
  // final bannerIngredientes = [
  //   "images/arbeja.png",
  //   "images/arroz.png",
  //   "images/cebolla.png",
  //   "images/fideo.png",
  //   "images/lechuga.png",
  //   "images/tomate.png",
  //   "images/zanahoria.png",
  // ];
  // @override
  // Widget build(BuildContext context) {
  //   var screenWidth = MediaQuery.of(context).size.width;
  //   List<Widget> banners = new List<Widget>();
  //   for (int i = 0; i < bannerIngredientes.length; i++) {
  //     var bannerView = Container(
  //       margin:EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
  //       decoration: BoxDecoration(
  //         color: primaryYellow,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       padding: EdgeInsets.symmetric(horizontal: 5),
  //       child: Image.asset(bannerIngredientes[i]),
  //       width: 60,
  //       height: 60,
  //     );
  //     banners.add(bannerView);
  //   }
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 26),
  //       child: Row(
  //         children: banners,
  //       ),
  //     ),
  //   );
  // }
}
