import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import '../../constants.dart';

class BannerIngredientes extends StatelessWidget {
  List<Ingredient> ingredientes;
  BannerIngredientes(this.ingredientes);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    if (ingredientes == null || ingredientes.length == 0) {
      print('No hay ingredientes');
      var bannerView = Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Chip(
          label: Text(
            'Ingredientes no disponibles',
            style: TextStyle(color: primaryWhite, fontSize: 12),
          ),
          backgroundColor: primaryBrown,
        ),
      );
      banners.add(bannerView);
    } else {
      print('LENGTH: ${ingredientes.length}');
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
    // return FutureBuilder(
    //   future: utils.enToEs(ingrediente),
    //   initialData: null,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (!snapshot.hasData) {
    //       return CircularProgressIndicator();
    //     } else {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Chip(
        label: Text(
          ingrediente,
          style: TextStyle(color: primaryWhite, fontSize: 12),
        ),
        backgroundColor: primaryBrown,
      ),
    );
    //     }
    //   },
    // );
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
