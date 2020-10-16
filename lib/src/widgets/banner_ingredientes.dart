import 'package:flutter/material.dart';

import '../../constants.dart';

class BannerIngredientes extends StatelessWidget {
  final bannerIngredientes = [
    "images/arbeja.png",
    "images/arroz.png",
    "images/cebolla.png",
    "images/fideo.png",
    "images/lechuga.png",
    "images/tomate.png",
    "images/zanahoria.png",
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerIngredientes.length; i++) {
      var bannerView = Container(
        margin:EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
        decoration: BoxDecoration(
          color: primaryYellow,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(bannerIngredientes[i]),
        width: 60,
        height: 60,
      );
      banners.add(bannerView);
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
}
